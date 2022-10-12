#!/bin/bash

SUFFIX="100M"
N_COMMENTS=100000000
DATE=$(date +"%Y-%m-%d-%T")

sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "the_donald_2016" "the_donald_2016_${SUFFIX}" ${N_COMMENTS} ${DATE};
sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "politics_2016" "politics_2016_${SUFFIX}" ${N_COMMENTS} ${DATE};
sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "sandersforpresident_2016" "sandersforpresident_2016_${SUFFIX}" ${N_COMMENTS} ${DATE};
sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "conservative_2016" "conservative_2016_${SUFFIX}" ${N_COMMENTS} ${DATE};

sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "the_donald_2015" "the_donald_2015_${SUFFIX}" ${N_COMMENTS} ${DATE};
sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "politics_2015" "politics_2015_${SUFFIX}" ${N_COMMENTS} ${DATE};
sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "sandersforpresident_2015" "sandersforpresident_2015_${SUFFIX}" ${N_COMMENTS} ${DATE};
sbatch /projects/tir6/strubell/jmilbaue/LinguisticConsensus/src/batch_scripts/train.sbatch "conservative_2015" "conservative_2015_${SUFFIX}" ${N_COMMENTS} ${DATE};

