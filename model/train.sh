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

conda activate vernet

srun python3 ./train.py --outdir ../vernet_model --train_path /scratch/project_2002016/datasets/data-gec/vernet_data/vtrain --valid_path /scratch/project_2002016/datasets/data-gec/vernet_data/vvalid --bert_pretrain sberbank-ai/ruBert-base