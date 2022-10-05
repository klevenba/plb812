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
trimmomatic PE -threads 10 -phred33 ERR754057_1.fastq.gz ERR754057_2.fastq.gz ERR754057_1P.fastq.gz ERR754057_1U.fastq.gz ERR754057_2P.fastq.gz ERR754057_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754058_1.fastq.gz ERR754058_2.fastq.gz ERR754058_1P.fastq.gz ERR754058_1U.fastq.gz ERR754058_2P.fastq.gz ERR754058_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754068_1.fastq.gz ERR754068_2.fastq.gz ERR754068_1P.fastq.gz ERR754068_1U.fastq.gz ERR754068_2P.fastq.gz ERR754068_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754074_1.fastq.gz ERR754074_2.fastq.gz ERR754074_1P.fastq.gz ERR754074_1U.fastq.gz ERR754074_2P.fastq.gz ERR754074_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754078_1.fastq.gz ERR754078_2.fastq.gz ERR754078_1P.fastq.gz ERR754078_1U.fastq.gz ERR754078_2P.fastq.gz ERR754078_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754086_1.fastq.gz ERR754086_2.fastq.gz ERR754086_1P.fastq.gz ERR754086_1U.fastq.gz ERR754086_2P.fastq.gz ERR754086_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30
trimmomatic PE -threads 10 -phred33 ERR754089_1.fastq.gz ERR754089_2.fastq.gz ERR754089_1P.fastq.gz ERR754089_1U.fastq.gz ERR754089_2P.fastq.gz ERR754089_2U.fastq.gz ILLUMINACLIP:/mnt/home/klevenba/miniconda3/envs/plb812/share/trimmomatic-0.39-2/adapters/TruSeq2-PE.fa:2:30:10:2:True LEADING:10 TRAILING:10 MINLEN:30

#Assess the quality of trimmed data
fastqc -f fastq -o /mnt/home/klevenba/plb812/data ERR754057_1P.fastq.gz ERR754057_2P.fastq.gz ERR754058_1P.fastq.gz ERR754058_2P.fastq.gz ERR754068_1P.fastq.gz ERR754068_2P.fastq.gz ERR754074_1P.fastq.gz ERR754074_2P.fastq.gz ERR754078_1P.fastq.gz ERR754078_2P.fastq.gz ERR754086_1P.fastq.gz ERR754086_2P.fastq.gz ERR754089_1P.fastq.gz ERR754089_2P.fastq.gz
