#!/bin/bash

# MODEL -> ALL

MODEL_DIR="/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/experiments/conservative_2016_100M"
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2015_test.txt";
wait;

MODEL_DIR="/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/experiments/politics_2016_100M"
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2015_test.txt";
wait;

MODEL_DIR="/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/experiments/the_donald_2016_100M"
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2015_test.txt";
wait;

MODEL_DIR="/projects/tir6/strubell/jmilbaue/LinguisticConsensus/output/experiments/sandersforpresident_2016_100M"
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2016_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/politics_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/the_donald_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/conservative_2015_test.txt" &
sbatch --wait /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/eval.sbatch ${MODEL_DIR} "/projects/tir6/strubell/jmilbaue/LinguisticConsensus/data/generated/splits/sandersforpresident_2015_test.txt";
wait;