# download reddit data
sbatch --wait download.sbatch;
wait;

# extract political communities
sbatch --wait download_to_jsonl.sbatch;
wait;

# sort into train, dev, test
sbatch --wait jsonl_to_collated.sbatch;
wait;
sbatch --wait collated_to_splits.sbatch;
wait;

# train on the data

./run_training.sh

# run inference: self-similarity + cross-similarity

./run_eval.sh

# run inference: cross-similarity
# run inference: LM-as-classifier

# build user graph
# get stats: comment frequency over time (by week)
# get stats: overlap over time
# get stats: user overlap