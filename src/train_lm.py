from pathlib import Path
import zstandard as zstd
import io
import json
from tqdm import tqdm
import csv
import sys
from sklearn.model_selection import train_test_split

import config as cfg
from reddit import reader
from train.utils import MyDataset, MyCollator

import torch
from torch.utils.data import DataLoader, Dataset

import transformers
from transformers import BertTokenizer, BertForMaskedLM
from transformers import Trainer, TrainingArguments
from transformers.integrations import TensorBoardCallback
import evaluate

args = sys.argv[1:] #[community, experiment_name]

# Load the pretrained tokenizer and model

tokenizer = BertTokenizer.from_pretrained('bert-base-cased')
model = BertForMaskedLM.from_pretrained('bert-base-cased')

# Load the dataset

train_path = Path(cfg.reddit_splits_dir) / f"{args[0]}_train.txt"
val_path = Path(cfg.reddit_splits_dir) / f"{args[0]}_val.txt"

train_dataset = MyDataset(train_path, tokenizer, max_tokens=int(args[2]))
val_dataset = MyDataset(val_path, tokenizer, max_tokens=100000)
num_training_tokens = int(args[2])
num_epochs = num_training_tokens / len(train_dataset) # guarantees the number of tokens seen.

print(f"Tokens per epoch: {len(train_dataset)}")
print(f"Epochs: {num_epochs}")

# Define the metrics

metric = evaluate.load("accuracy")

def compute_metrics(eval_pred):
    logits, labels = eval_pred
    predictions = np.argmax(logits, axis=-1)
    return metric.compute(predictions=predictions, references=labels)

# Build the trainer

training_args = TrainingArguments(
    num_train_epochs=num_epochs,
    output_dir=Path(cfg.experiment_dir) / args[3] / args[1],
    save_steps=10000,
    save_total_limit=50,
)
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=train_dataset,
    data_collator=MyCollator(tokenizer, mlm_probability=0.15),
    eval_dataset=val_dataset,
    compute_metrics=compute_metrics,
    callbacks=[TensorBoardCallback],
)

# train the trainer.

trainer.train()
trainer.save_model()