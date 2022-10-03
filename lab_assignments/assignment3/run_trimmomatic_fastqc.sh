#!/bin/bash --login
#SBATCH --time=168:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=100GB
#SBATCH --job-name assignment3
#SBATCH --output=%x-%j.SLURMout

#Change to current working directory
cd ${PBS_O_WORKDIR}

#Add conda environment to the path
export PATH="${HOME}/miniconda3/envs/plb812/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/miniconda3/envs/plb812/lib:${LD_LIBRARY_PATH}"

#Trim the data 
trimmomatic PE -threads 10 -phred33 ERR754057_1.fastq.gz ERR754057_2.fastq.gz ERR754057_1.trimmed.fastq.gz ERR754057_1.untrimmed.fastq.gz ERR754057_2.trimmed.fastq.gz ERR754057_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754058_1.fastq.gz ERR754058_2.fastq.gz ERR754058_1.trimmed.fastq.gz ERR754058_1.untrimmed.fastq.gz ERR754058_2.trimmed.fastq.gz ERR754058_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754068_1.fastq.gz ERR754068_2.fastq.gz ERR754068_1.trimmed.fastq.gz ERR754068_1.untrimmed.fastq.gz ERR754068_2.trimmed.fastq.gz ERR754068_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754074_1.fastq.gz ERR754074_2.fastq.gz ERR754074_1.trimmed.fastq.gz ERR754074_1.untrimmed.fastq.gz ERR754074_2.trimmed.fastq.gz ERR754074_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754078_1.fastq.gz ERR754078_2.fastq.gz ERR754078_1.trimmed.fastq.gz ERR754078_1.untrimmed.fastq.gz ERR754078_2.trimmed.fastq.gz ERR754078_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754086_1.fastq.gz ERR754086_2.fastq.gz ERR754086_1.trimmed.fastq.gz ERR754086_1.untrimmed.fastq.gz ERR754086_2.trimmed.fastq.gz ERR754086_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754089_1.fastq.gz ERR754089_2.fastq.gz ERR754089_1.trimmed.fastq.gz ERR754089_1.untrimmed.fastq.gz ERR754089_2.trimmed.fastq.gz ERR754089_2.untrimmed.fastq.gz ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 MINLEN:30

#Assess the quality of trimmed data
fastqc –f fastq –o cd /mnt/home/klevenba/plb812/data ERR754057_1.trimmed.fastq.gz ERR754057_2.trimmed.fastq.gz ERR754058_1.trimmed.fastq.gz ERR754058_2.trimmed.fastq.gz ERR754068_1.trimmed.fastq.gz ERR754068_2.trimmed.fastq.gz ERR754074_1.trimmed.fastq.gz ERR754074_2.trimmed.fastq.gz ERR754078_1.trimmed.fastq.gz ERR754078_2.trimmed.fastq.gz ERR754086_1.trimmed.fastq.gz ERR754086_2.trimmed.fastq.gz ERR754089_1.trimmed.fastq.gz ERR754089_2.trimmed.fastq.gz 
