#!/bin/bash

#SBATCH --job-name=spyking_mpi
#SBATCH --output=spyking_out.txt
#SBATCH --ntasks=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=cpu

# Feel free to replace with an input argument grabber here
DATA_PATH="./BR_200710_2579um.raw"
ENV_PATH="./spyking_env"
QT_DEBUG_PLUGINS=1

# Load our environment prerequisites
ml Anaconda2/2019.03
ml X11

# Activate our environment
source $(conda info --json | awk '/conda_prefix/ { gsub(/"|,/, "", $2); print $2 }')/bin/activate ${ENV_PATH}

# Generate an mpi hosts file 
python convert_to_hosts.py $SLURM_NODELIST $SLURM_CPUS_PER_TASK

# Run spyking-circus
spyking-circus $DATA_PATH -H mpi.hosts -c $SLURM_CPUS_PER_TASK

