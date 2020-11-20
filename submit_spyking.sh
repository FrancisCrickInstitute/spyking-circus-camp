#!/bin/bash

#SBATCH --job-name=spyking_mpi
#SBATCH --output=spyking_out.txt
#SBATCH --ntasks=2
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=cpu

# Feel free to replace with an input argument grabber here
DATA_PATH="/camp"

# Load our environment prerequisites
ml Ananconda2
ml OpenMPI/2.1.1-GCC-6.4.0-2.28

# Generate an mpi hosts file 
python convert_to_hosts.py $SLURM_NODELIST $SLURM_CPUS_PER_TASK

# Run spyking-circus
spyking-circus $DATA_PATH -H mpi.hosts

