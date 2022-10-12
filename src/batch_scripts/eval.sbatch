#!/bin/bash
#SBATCH --job-name=eval
#SBATCH --err=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/eval/%j.err
#SBATCH --out=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/eval/%j.out
#SBATCH --time=24:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1

conda init bash;
source activate consensus;
echo "starting.";
echo "Parameters: ${1} ${2}"
python3 /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/eval_lm.py $1 $2
echo "done.";