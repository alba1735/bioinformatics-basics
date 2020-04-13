---
layout: default
title: Using A UNIX Server
parent: "RNA Sequencing Analysis"
nav_order: 1
---
# The UNIX Method

Obtaining the file… See Galaxy method below for how to get them to your desktop we can then move them to the server with `scp`. We can move the file from our local machine to the server (hummingbird) via a command called `scp` (secure-copy). `scp` works the same as `cp` (copy) aka `cp <source> <destination>` however you can specify across two machines:

```
scp source/on/my/computer cruzid@hb.ucsc.edu:destination/on/this/server
scp ~/Downloads/fasta.fa abagi@hb.ucsc.edu:~/bme110/.
```

Since this can be tricky and may take some practice I have provided the files needed to follow along in the folder `/hb/home/abagi/bme110/rnaseq_analysis/` you will need to copy the folders `sra` `reference` `gtf` and `slurm`. The files in the `sra` folder are the *e.coli* wild-type and mutant fastq reads

The files in the `reference` folder are the *e.coli* genome. The files in the `gtf` folder are the *e.coli* genes.

## Mapping reads

Type this command:

`sbatch build_bowtie2_index.mpi`

After it finishes (you can check with `squeue`) run this command:

`sbatch align_fastq_reads.mpi`

We are going to use `Bowtie2` to map reads to the genome. It's part of a genome analysis toolkit developed by Steven Salzberg's lab which includes tools like `Bowtie`, `TopHat`, `Cufflinks`, etc. Inside the `slurm` folder, you will see several scripts.


Let's look at `build_bowtie2_index.mpi` right now using `cat`, `less`, or `more`.

We create multiple directories. We build the `bowtie2` index (needed to run `bowtie2`) from our reference genome ecolik12.fa and place it in the folder called index. We then use `samtools` to create a chromosome size reference.

The other slurm job aligns the two fastq reads and gives us and output as a sam file. When this finishes (~10-20 min) we can run the next job.

## Get coverage track onto the Genome Browser

This script `sam_to_bam.mpi` can also take a few moments to run.


We first need the SAM files in BAM format, fortunately, we can use `samtools` to easily do this. A SAM file is a Sequence Alignment Map and a BAM file is Binary (Sequence) Alignment Map. A BAM file can be smaller and more efficient to work with but is not human readable.

We want to be able to look at this data on the genome browser so we need to generate a BigWig file as well so in order to do that we can use `bedtools` to make a bedgraph and then convert the bedgraph to a BigWig file. If the previous script has finished (check with `squeue`) we can run the `genome_coverage.mpi` This slurm job does three things:

* It uses samtools to sort the new bam files based on chrm position (required for the next step)
* It uses bedtools to generate a bedgraph (bg) file
* It then uses BedGraphToBigWig to generate our BigWig (bw) files

We now need to move files between the server and our local machine, we already learned `scp` but let us also learn `sftp` (Secure File Transfer Protocol) since it gives us more options. Lets open a new terminal and run the following command

```
sftp cruzid@hb.ucsc.edu
```

Unlike normal browsing, through the terminal, you now have a `>` in front of everything. Typing `ls` still lists but…


If you type `lls` you can now list your local machine instead of the server. Additionally, you can use `cd` on the server (as normal), but also `lcd` (local change directory) to move around your local machine as well. Let us navigate locally to our Desktop:

* For mac/linux people that can be `lcd ~/Desktop`
* For Windows that would by default be `lcd /mnt/c/Users/<username>/Desktop`

Then lets navigate to my BigWig files

```
cd /hb/home/abagi/bme110/rnaseq_analysis/
```

With `sftp` you have two commands `Get` and `Put`


If you type `put <filename/folder>` it will push it to the directory on the server, similarly if you type `get <filename/folder>` it will pull it to your local machine from the server. Try it now:

```
get -r bw
```

See how it pulls our bigwig folder locally, which we can now load into the genome browser.

## Test genes for differential expression between WT and ΔSoxS conditions

We will use `Cuffdiff` to quantify reads. What this does is compare the number of reads at a gene in one condition (in this case, WT) versus the number of reads at the gene in another condition (in this case, ΔSoxS). The idea is that under different conditions, cells will regulate gene expression differently.

We will use the slurm script `cufflinks_diff.mpi` to do this.

## Putting it all together

This was a lot of work it would be nice if we could run all these commands and come back later when it finishes. Let's see how the script `align_to_cuffdiff_pipeline.sh` does this. Shell scripts (sh) are powerful and can use loops and variables. They will save you lots of time and make experiments easier to repeat.

We can call everything we did today with the `run_all.mpi` which is a slurm job that calls the shell script above.
