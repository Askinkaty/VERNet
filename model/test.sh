#!/usr/bin/env bash

#SBATCH --account=project_2002016
#SBATCH --job-name=vernet

#SBATCH --partition=gpu

#SBATCH --cpus-per-task=10
#SBATCH --mem=80G
#SBATCH --ntasks=1
#SBATCH --time=2:00:00
#SBATCH --gres=gpu:v100:1

module load gcc/8.3.0 cuda/10.1.168

export DIR=/projappl/project_2002016/VERNet/model
cd $DIR

conda activate gpt

#srun python3 ./test.py --test_path /scratch/project_2002016/datasets/data-gec/vernet_data/test.jsonl --bert_pretrain sberbank-ai/ruBert-base --checkpoint ../vernet_model/model.best.pt
# {'p': 0.9053114916852817, 'r': 0.544931650108314, 'f': 0.6803450687806015, 'f05': 0.7995572020430084}
srun python3 ./test_src.py --test_path /scratch/project_2002016/datasets/data-gec/vernet_data/test.jsonl --bert_pretrain sberbank-ai/ruBert-base --checkpoint ../vernet_model/model.best.pt

