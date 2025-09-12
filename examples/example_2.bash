#!/bin/bash
#SBATCH --array=1-2
#SBATCH --job-name="example_2"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=100
#SBATCH --mail-type=END,FAIL,ARRAY_TASKS
#SBATCH --mail-user=bt309277@uni-bayreuth.de
#SBATCH --time=0-00:03:00
#SBATCH --error=ex_%A_%a.err
#SBATCH --output=ex_%A_%a.out #err/out file with <JOBID>_<JOBARRAY_INDEX>

module load R/4.4.1

echo "R/4.4.1 loaded"

SCRIPTS=(./Rscripts/Permutationen_KDE_Cluster_8.R ./Rscripts/Permutationen_KDE_Cluster_9.R)

Rscript ${SCRIPTS[$SLURM_ARRAY_TASK_ID-1]}

echo "Rscript ${SCRIPTS[$SLURM_ARRAY_TASK_ID-1]} loaded"

echo "You submitted the permutations example with the job ID ${SLURM_JOB_ID}."