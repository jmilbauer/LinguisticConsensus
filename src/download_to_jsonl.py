from pathlib import Path
import json
from tqdm import tqdm

import config as cfg
from reddit import reader
import logging

completed = []

communities = ['the_donald', 'conservative', 'politics', 'sandersforpresident']

for f in Path(cfg.reddit_download_dir).glob("**/*.zst"):
    if f not in completed:
        with open(Path(cfg.reddit_clean_dir) / f"{f.stem}.jsonl", 'w') as fpO:
            for comment in tqdm(reader.stream_comments(f, target_communities=communities)):
                if comment is None:
                    continue
                obj = {
                    'user':comment['author'],
                    'text':comment['body'],
                    'community':comment['subreddit'].lower()
                }
                fpO.write(f"{json.dumps(obj)}\n")
    completed.append(f)
    print(completed)