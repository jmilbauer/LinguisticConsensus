#!/bin/bash
#SBATCH --job-name=download
#SBATCH --err=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/download.err
#SBATCH --out=/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/batch_logs/download.out
#SBATCH --time=0
#SBATCH --mem=32G

conda init bash;
echo "starting.";
/projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/download.sh /projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/
echo "done.";