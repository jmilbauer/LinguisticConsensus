from pathlib import Path
from tqdm import tqdm
import os
import sys
import csv

import torch
from torch.utils.data import DataLoader, Dataset
from transformers import BertTokenizer, BertForMaskedLM
from nltk.tokenize import sent_tokenize
import numpy as np

import config as cfg
from train.utils import MyDataset, MyCollator

args = sys.argv[1:]
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

def get_last_checkpoint(directory):
    numbers = []
    for f in directory.glob("checkpoint-*"):
        numbers.append((int(f.stem.split('-')[-1]), f))
        
    return list(sorted(numbers, reverse=True))[0][1]

model_path = Path(args[0])
checkpoint_path = Path(get_last_checkpoint(model_path))
model = BertForMaskedLM.from_pretrained(
    pretrained_model_name_or_path=checkpoint_path)

tokenizer = BertTokenizer.from_pretrained('bert-base-cased')
eval_path = Path(args[1])
eval_dataset = MyDataset(eval_path, tokenizer, max_sentences=10000)

results_target = Path(cfg.sentence_loss_results) / checkpoint_path.parent.stem
if not results_target.exists():
    os.makedirs(results_target)
results_target = results_target / f"{eval_path.stem}.csv"

def score_sentence(model, sentence, batch_size=16):
    with torch.no_grad():
        tokenized = tokenizer(sentence, return_tensors='pt', truncation=True, max_length=512)
        length = tokenized['input_ids'].shape[-1]
        for k in tokenized:
            tokenized[k] = tokenized[k][0].repeat(length-2, 1)

        mask = torch.ones(length - 1).diag(1)[:-2]
        masked_input = tokenized['input_ids'].masked_fill(mask == 1, 103)
        labels = tokenized['input_ids'].masked_fill(masked_input != 103, -100)
        
        loss = 0
        for i in range(0, masked_input.shape[0], batch_size):
            mask_chunk = masked_input[i:i+batch_size, :]
            label_chunk = labels[i:i+batch_size, :]
            loss += mask_chunk.shape[0] * model(mask_chunk.to(device), labels=label_chunk.to(device)).loss.cpu().item()
        if loss != 0:
            loss /= masked_input.shape[0]
    return loss

model = model.to(device)

with open(results_target, 'w') as fp:
    writer = csv.DictWriter(fp, fieldnames=['sentence', 'loss'])
    writer.writeheader()
    for s in tqdm(eval_dataset):
        loss = score_sentence(model, s)
        writer.writerow({'sentence':s, 'loss':loss})