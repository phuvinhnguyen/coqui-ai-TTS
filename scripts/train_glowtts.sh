#!/bin/bash
#SBATCH --job-name=glow_tts_train       Job name
#SBATCH --output=glow_tts_%j.out       # Output file (%j expands to jobId)
#SBATCH --error=glow_tts_%j.err        # Error file (%j expands to jobId)
#SBATCH --nodes=1                      # Number of nodes requested
#SBATCH --ntasks=1                     # Number of tasks (processes)
#SBATCH --cpus-per-task=4              # CPU cores per task
#SBATCH --gres=gpu:1                   # GPU count
#SBATCH --mem=32G                      # Memory requested
#SBATCH --time=12:00:00                # Wall time (HH:MM:SS)
#SBATCH --partition=amperenodes        # Request GPU partition
#SBATCH --mail-type=ALL                # Send email on job start, end and fail

conda activate tts

# Run the training script
python train_glow_tts.py \
  --data_path recipes/ljspeech/LJSpeech-1.1