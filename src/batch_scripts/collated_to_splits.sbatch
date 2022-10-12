#!/bin/bash
#SBATCH --job-name=split
#SBATCH --err=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/split.err
#SBATCH --out=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/split.out
#SBATCH --time=2:00:00
#SBATCH --mem=16G

conda init bash;
echo "starting.";
python3 /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/collated_to_splits.py
echo "done.";