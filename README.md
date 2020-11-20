# Notes

This is a set of example scripts used to get spyking-circus working on CAMP. Note - please choose a good directory for the steps below as for now it will need to contain your environment & working directory - it should also be universally accessible from all nodes.

1. Prepare the environment using ```./spyking_setup_camp.sh``` - if you wish to edit the target path you can do so by editing this script and modifying the 'prefix' flag.
2. Edit the submit_spyking.sh file with your extecution constraints (number of nodes, tasks, and cpus - see slurm documentation for more details here) additionally modify the DATA_PATH and ENV_PATH variables (this behaviour can be modified in future)
3. Submit the job to slurm using ```sbatch ./submit_spyking.sh```
