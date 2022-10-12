#!/bin/bash
#SBATCH --job-name=collate
#SBATCH --err=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/collate.err
#SBATCH --out=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/collate.out
#SBATCH --time=12:00:00
#SBATCH --mem=16G

conda init bash;
echo "starting.";
python3 /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/jsonl_to_collated.py
echo "done.";