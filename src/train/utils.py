from pathlib import Path
import zstandard as zstd
import io
import json
from tqdm import tqdm
import csv
from sklearn.model_selection import train_test_split

import config as cfg
from reddit import reader

import torch
from torch.utils.data import DataLoader, Dataset

import transformers
from transformers import BertTokenizer, DataCollatorForLanguageModeling, BertForMaskedLM, Trainer

class MyDataset(Dataset):
    
    def __init__(self, f, tokenizer, max_tokens=None, max_sentences=None):
        self.X = []
        n_tokens = 0
        n_sentences = 0
        with open(f) as fp:
            for i, line in tqdm(enumerate(fp)):
                n_tokens += len(line.strip().split())
                if max_tokens is not None or max_sentences is not None:
                    if max_sentences is not None and n_sentences >= max_sentences:
                        break
                    if max_tokens is not None and n_tokens > max_tokens:
                        break
                self.X.append(line.strip())
                n_sentences += 1
    
    def __getitem__(self, idx):
        return self.X[idx]
    
    def __len__(self):
        return len(self.X)
    
class MyCollator(object):
    def __init__(self, tokenizer, mlm_probability=.15):
        self.tokenizer = tokenizer
        self.mlm_probability = mlm_probability
        return
    
    def torch_mask_tokens(self, inputs, special_tokens_mask):
        labels = inputs.clone()
        probability_matrix = torch.full(labels.shape, self.mlm_probability)
        if special_tokens_mask is None:
            special_tokens_mask = [
                self.tokenizer.get_special_tokens_mask(val, already_has_special_tokens=True) for val in labels.tolist()
            ]
            special_tokens_mask = torch.tensor(special_tokens_mask, dtype=torch.bool)
        else:
            special_tokens_mask = special_tokens_mask.bool()
            
        probability_matrix.masked_fill_(special_tokens_mask, value=0.0)
        masked_indices = torch.bernoulli(probability_matrix).bool()
        labels[~masked_indices] = -100
        
        # 80% of the time, we replace masked input tokens with tokenizer.mask_token ([MASK])
        indices_replaced = torch.bernoulli(torch.full(labels.shape, 0.8)).bool() & masked_indices
        inputs[indices_replaced] = self.tokenizer.convert_tokens_to_ids(self.tokenizer.mask_token)

        # 10% of the time, we replace masked input tokens with random word
        indices_random = torch.bernoulli(torch.full(labels.shape, 0.5)).bool() & masked_indices & ~indices_replaced
        random_words = torch.randint(len(self.tokenizer), labels.shape, dtype=torch.long)
        inputs[indices_random] = random_words[indices_random]

        # The rest of the time (10% of the time) we keep the masked input tokens unchanged
        return inputs, labels
            
    def __call__(self, batch):
        # tokenize the batch
        batch = self.tokenizer(
            batch,
            return_tensors='pt',
            padding='longest',
            truncation=True,
            max_length=512)
        
        # mask the tokens in the batch
        batch["input_ids"], batch["labels"] = self.torch_mask_tokens(
                batch["input_ids"], special_tokens_mask=None
            )
        
        return batch