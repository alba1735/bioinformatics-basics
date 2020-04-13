---
layout: default
title:  "Jalview"
nav_order: 5
has_children: false
nav_exclude: true
---
# Jalview

Slurm is the program used by Hummingbird in order to allocate jobs on the server. With many people requesting to use the server simultaneously it is important to have a system like this. Slurm works by creating a text file ending with `job_description.mpi` and running the command `sbatch` feeding it the aforementioned text file.

http://www.jalview.org/
{: .fs-6 .fw-300 }

A typical slurm file will look like the following:
