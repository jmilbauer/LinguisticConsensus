#!/bin/bash
#SBATCH --job-name=extract
#SBATCH --err=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/extract.err
#SBATCH --out=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/extract.out
#SBATCH --time=12:00:00
#SBATCH --mem=16G

conda init bash;
echo "starting.";
python3 ../download_to_jsonl.py
echo "done.";