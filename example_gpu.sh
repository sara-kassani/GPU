#!/bin/bash

######## Note only lines with #SBATCH will be read and taken into account

######## Job's Name and outputs ########
#### name of job, change name_job
#SBATCH --job-name test_job

#### stdout default path
#SBATCH -o test_job.stdout.txt

#### stderr default path 
#SBATCH -e test_job.stderr.txt 

######## Walltime ########
###SBATCH --time 48:00:00
#SBATCH --time 168:00:00

######## GPU request (reference: https://sites.wustl.edu/chpc/resources/hardware/) ########
#SBATCH --gres gpu:1,vmem:32gb:1
#SBATCH --partition=gpu 
#SBATCH -w gpu03 

######## Email Options (reference: https://slurm.schedmd.com/sbatch.html) ########
#SBATCH --mail-type=BEGIN
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=hosseinzadehkassani@wustl.edu

##############################your code goes here
#### load python module
#module load python/3.7.4

#please change name_python_environment with the real name of your environment
#source activate name_python_environment

#source bashrc 
source ~/.bashrc 

#activate miniconda environment 
conda activate pytorch_env 

#Run python script python_gpu_script.py 
python -u test_gpu_pytorch_monai_segmentation.py

