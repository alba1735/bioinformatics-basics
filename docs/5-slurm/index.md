---
layout: default
title:  "Slurm"
nav_order: 5
has_children: false
nav_exclude: false
---
# Slurm

Slurm is the program used by Hummingbird in order to allocate jobs on the server. With many people requesting to use the server simultaneously it is important to have a system like this. Slurm works by creating a text file ending with `job_description.mpi` and running the command `sbatch` feeding it the aforementioned text file.
{: .fs-6 .fw-300 }

A typical slurm file will look like the following:

```
#!/bin/bash

#SBATCH -p 128x24   # Partition name
#SBATCH -J blastn_test        # Job name
#SBATCH —mail-user=@ucsc.edu
#SBATCH --mail-type=ALL
#SBATCH -o job%.j.out    # Name of stdout output file
#SBATCH -n 1        # Total number of mpi tasks requested per node
#SBATCH -t 01:30:00  # Run Time (hh:mm:ss) - 1.5 hours (optional)
#SBATCH --mem=4G # Memory to be allocated PER NODE

blastn -query /hb/home/abagi/mystery_argonaute.fa -db /hb/home/abagi/db/nt/nt
```

This template will hardly ever have to be modified by yourselves. All the lines that start with `#SBATCH` tell the server things like how many CPUs and how much memory you want to use. You can put as many commands as you would like in a SLURM file the example I provided below has a single command:
```
blastn -query /hb/home/abagi/mystery_argonaute.fa -db /hb/home/abagi/db/nt/nt
```
This code, in particular, will run a blastn against a test fasta file. It will then output the text to the folder you called the script from and name it `SLURM-job-xxxxx.out`.

You can try this out yourself by running the following command:
```
sbatch /hb/home/abagi/bme110/slurm_intro/blastn_test.mpi
```
You can then see where you stand in the queue by using the command `squeue`.

The rule of thumb is if something is not instantaneous and will take more than a few seconds you should run the job through slurm or else you will get a nasty email from SOE.
