#!/bin/bash -l
#SBATCH -J BRATS
#SBATCH -N 1
#SBATCH --ntasks-per-node=7
#SBATCH -c 1                # Cores assigned to each tasks
#SBATCH -G 1
#SBATCH --time=0-8:00:00
#SBATCH -p gpu
#SBATCH --qos normal
#SBATCH --array=0-3

epochs=10

#module load lang/Anaconda3/2020.11
module load system/CUDA
sleep 2s
conda activate MONAI-BRATS

nvidia-smi
python brats_train.py --nfolds ${SLURM_ARRAY_TASK_ID} --fold ${SLURM_ARRAY_TASK_COUNT} --epochs $epochs
