#!/bin/bash
#SBATCH --job-name="example_1"
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=bt000000@uni-bayreuth.de
#SBATCH --time=0-00:01:00
#SBATCH --error=%x_%j.err     # %x - Job-Name
#SBATCH --output=%x_%j.out    # %j - Job-Number

echo "Hello $USER, my name is $HOSTNAME."
echo "The job with the ID $SLURM_JOB_ID has started."

module load R/4.4.1
echo "R/4.4.1 loaded successfully"

Rscript ./Rscripts/example_1.R

echo "Rscript loaded successfully"
echo "The job with the ID $SLURM_JOB_ID is finished."