"""This file is for reading files from the downloads"""
import zstandard as zstd
import io
import json

def stream_comments(f, target_communities=None):
    """
    
    Args:
        f: File name string
        target_communities: List of strings representing the communities to extract comments from.
    """
    
    if target_communities is None:
        target_communities = []
        
    with open(f, 'rb') as fp:
        dctx = zstd.ZstdDecompressor(max_window_size=2147483648)
        stream_reader = dctx.stream_reader(fp)
        text_stream = io.TextIOWrapper(stream_reader, encoding='utf-8')
        for line in text_stream:
            obj = json.loads(line)
            if obj['subreddit'].lower() in target_communities:
                yield obj
            else:
                yield None