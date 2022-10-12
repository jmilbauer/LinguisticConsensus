#!/bin/bash
#SBATCH --job-name=train
#SBATCH --err=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/train/%j.err
#SBATCH --out=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/train/%j.out
#SBATCH --time=0
#SBATCH --mem=32G
#SBATCH --gres=gpu:1

conda init bash;
source activate consensus;
echo "starting.";
nvidia-smi;
echo "Parameters: ${1} ${2} ${3} ${4}"
python3 /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/train_lm.py $1 $2 $3 $4
echo "done.";