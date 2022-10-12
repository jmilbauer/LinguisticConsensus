from pathlib import Path
import zstandard as zstd
import io
import json
from tqdm import tqdm
import csv
from sklearn.model_selection import train_test_split

import config as cfg
from reddit import reader

for f in Path(cfg.reddit_splits_dir).glob("*.csv"):
    comments = []
    with open(f) as fp:
        reader = csv.reader(fp)
        for user, comment in tqdm(reader):
            comments.append(comment)
            
    comments = [' '.join(x.split()) for x in comments if x != '[removed]']
    train, test = train_test_split(comments, test_size=.2, random_state=55)
    val, test = train_test_split(comments, test_size=.5, random_state=55)
    
    for comments, name in zip([train, val, test], ["train", "val", "test"]):
        with open(Path(cfg.reddit_splits_dir) / f"{f.stem}_{name}.txt", 'w') as fp:
            for c in tqdm(comments):
                fp.write(f"{c}\n")