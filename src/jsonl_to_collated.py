from pathlib import Path
import zstandard as zstd
import io
import json
from tqdm import tqdm
import csv

import config as cfg
from reddit import reader

csvs = {}
fps = {}
for f in Path(cfg.reddit_clean_dir).glob("*.jsonl"):
    name = f.stem
    year = int(name.split('_')[1].split('-')[0])
    with open(f) as fp:
        for line in tqdm(fp):
            data = json.loads(line)
            target = f"{data['community']}_{year}.csv"
            if target not in csvs:
                fps[target] = open(Path(cfg.reddit_splits_dir) / target, 'w')
                csvs[target] = csv.writer(fps[target])
            csvs[target].writerow([data['user'], data['text']])