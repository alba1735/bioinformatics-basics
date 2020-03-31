---
layout: default
---
BLAST
Using BLAST
Given the following mystery sequence

MVRLKSRYILFEIIFPPTDTNVEESVSKADILLSHHRASPADVSIKSILQEIRRSLSLNLGDYGSAKCNSLLQLKYFSNKTSTGIIRCHREDCDLVIMALMLMSKIGDVDGLIVNPVKVSGTIKKIEQFAMRRNSKILNIIKCSQSSHLSDNDFIINDFKKIGRENENENEDD
use BLAST to learn more about it. Answer the following questions and check your answers below.

What BLAST program should you use?
What species is it from?
What is the identity of this protein?
What is its biological function?
Which domains contain homologs?
Once you think you've figured these out, the answers are below (highlight to see white text).

blastp
Saccharomyces cerevisiae
POP5
RNase P subunit
Eukaryotes only
Command line BLAST
As with most computational biology tools, BLAST first originated on the command line. Then, NCBI set up some servers to run it, converted all their sequences into a database, and created a GUI wrapper so you can click on options.

Here's an example. Let's use command line blast this following mystery sequence to find out where it's from.

>mystery_seq
CAGTGATCTTTATGGGCCTTGGAAGAGGAAGTTCCTGGCAGACTTGGGGGTCATTAATCAATGTATTGCC
CCTCCGAATATGAGGAAAGTCAATGATCAATATTTAACAAATGTGGCTTTGAAAATAAATGCGAAGGTTG
GTGGCCTCAACTCTGTTTTATCTGTGGAATTTGCGCATAAGATACCTAAGATATCCACGAAACCAACAAT
TATTATTGGGATGGATGTTTCACACGGTTCTCCAGGACATGCAGATTCACCTTCAATTTCAGCGGTCGTC
TCATCGAGAGAATGGCCCTTGATTTCAAGATATAGAGCTTCAGTGAGAACTCAATCACCCAAGGTTGAGA
TGATTGAAGCTTTGTACAAACCGTTGCCCTCAGGAAAGGATGCGGGCATGATCAGTGAGCTACTTGTGGA
CTTCTACCAATCATGCAATCCGCCACCTAATGTAGAAAGAAAACCGCAGCAAATGATTGTCTTCAGAGAT
GGAGTCAGTGAATCACAATTTGACCAGGTCCTGAATGTTGAGTTACAAGCTATATATAAGGCATGCAATC
ACATAGAGGCTGGTTATAAGCCTAAAGTCACACTGATTATTGCACAGAAGAATCATCACACAAAGCTATT
CCCTAGTGGTGGTCCAGGCAATGTGCAGCCAGGGACTATTGTAGATGCCCAGATTTGTCATCCTAGAAAT
TTTGATTTTTACTTGTGTCCTCAGGCCGGCCCAATAGGAACATCACGGCCTACTCATTATCATGTCTTAC
TGGATGAGAATGATTTTAGTGTGGATGATCTTCAGATTCTTGTCCACGCTCTATCTTATGTGTATCAAAG
AAGTACGACCGCAATCTCTTCAGTTGCACCAATAAACTATGCGCATCTAGCTGCGAGCCAGATGCAACAA
TTCCTCAAGGCAGAGGATCTTTCAGAAACAGCTTCGCGATCTGGAAAAGGGGAAGGGTCAGTTGCATCTG
GAGGAGGAGGATACACTGCCCCTGTACCTGAACTCCCTGTGCTGCACCGAAATGTTTGCAACACCATGTT
TTTCTGCTGA
We'll use blastn to find nucleotide sequences that match this.

[blin@zam ~/.html/pub/bme110-w18]$ blastn -query mystery_argonaute.fa -db /projects/lowelab/db/nt/nt
BLASTN 2.3.0+


Reference: Zheng Zhang, Scott Schwartz, Lukas Wagner, and Webb
Miller (2000), "A greedy algorithm for aligning DNA sequences", J
Comput Biol 2000; 7(1-2):203-14.



Database: All GenBank+EMBL+DDBJ+PDB sequences (but no EST, STS,
GSS,environmental samples or phase 0, 1 or 2 HTGS sequences)
           10,077,905 sequences; 29,096,408,678 total letters



Query= mystery_argonaute

Length=1060
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

gb|DQ068741.1|  Picea glauca argonaute/Zwille-like protein mRNA, ...  1958    0.0  


>gb|DQ068741.1| Picea glauca argonaute/Zwille-like protein mRNA, complete cds
Length=2880

 Score = 1958 bits (1060),  Expect = 0.0
 Identities = 1060/1060 (100%), Gaps = 0/1060 (0%)
 Strand=Plus/Plus

Query  1     CAGTGATCTTTATGGGCCTTGGAAGAGGAAGTTCCTGGCAGACTTGGGGGTCATTAATCA  60
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  1821  CAGTGATCTTTATGGGCCTTGGAAGAGGAAGTTCCTGGCAGACTTGGGGGTCATTAATCA  1880

Query  61    ATGTATTGCCCCTCCGAATATGAGGAAAGTCAATGATCAATATTTAACAAATGTGGCTTT  120
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  1881  ATGTATTGCCCCTCCGAATATGAGGAAAGTCAATGATCAATATTTAACAAATGTGGCTTT  1940

Query  121   GAAAATAAATGCGAAGGTTGGTGGCCTCAACTCTGTTTTATCTGTGGAATTTGCGCATAA  180
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  1941  GAAAATAAATGCGAAGGTTGGTGGCCTCAACTCTGTTTTATCTGTGGAATTTGCGCATAA  2000

Query  181   GATACCTAAGATATCCACGAAACCAACAATTATTATTGGGATGGATGTTTCACACGGTTC  240
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2001  GATACCTAAGATATCCACGAAACCAACAATTATTATTGGGATGGATGTTTCACACGGTTC  2060

Query  241   TCCAGGACATGCAGATTCACCTTCAATTTCAGCGGTCGTCTCATCGAGAGAATGGCCCTT  300
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2061  TCCAGGACATGCAGATTCACCTTCAATTTCAGCGGTCGTCTCATCGAGAGAATGGCCCTT  2120

Query  301   GATTTCAAGATATAGAGCTTCAGTGAGAACTCAATCACCCAAGGTTGAGATGATTGAAGC  360
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2121  GATTTCAAGATATAGAGCTTCAGTGAGAACTCAATCACCCAAGGTTGAGATGATTGAAGC  2180

Query  361   TTTGTACAAACCGTTGCCCTCAGGAAAGGATGCGGGCATGATCAGTGAGCTACTTGTGGA  420
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2181  TTTGTACAAACCGTTGCCCTCAGGAAAGGATGCGGGCATGATCAGTGAGCTACTTGTGGA  2240

Query  421   CTTCTACCAATCATGCAATCCGCCACCTAATGTAGAAAGAAAACCGCAGCAAATGATTGT  480
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2241  CTTCTACCAATCATGCAATCCGCCACCTAATGTAGAAAGAAAACCGCAGCAAATGATTGT  2300

Query  481   CTTCAGAGATGGAGTCAGTGAATCACAATTTGACCAGGTCCTGAATGTTGAGTTACAAGC  540
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2301  CTTCAGAGATGGAGTCAGTGAATCACAATTTGACCAGGTCCTGAATGTTGAGTTACAAGC  2360

Query  541   TATATATAAGGCATGCAATCACATAGAGGCTGGTTATAAGCCTAAAGTCACACTGATTAT  600
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2361  TATATATAAGGCATGCAATCACATAGAGGCTGGTTATAAGCCTAAAGTCACACTGATTAT  2420

Query  601   TGCACAGAAGAATCATCACACAAAGCTATTCCCTAGTGGTGGTCCAGGCAATGTGCAGCC  660
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2421  TGCACAGAAGAATCATCACACAAAGCTATTCCCTAGTGGTGGTCCAGGCAATGTGCAGCC  2480

Query  661   AGGGACTATTGTAGATGCCCAGATTTGTCATCCTAGAAATTTTGATTTTTACTTGTGTCC  720
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2481  AGGGACTATTGTAGATGCCCAGATTTGTCATCCTAGAAATTTTGATTTTTACTTGTGTCC  2540

Query  721   TCAGGCCGGCCCAATAGGAACATCACGGCCTACTCATTATCATGTCTTACTGGATGAGAA  780
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2541  TCAGGCCGGCCCAATAGGAACATCACGGCCTACTCATTATCATGTCTTACTGGATGAGAA  2600

Query  781   TGATTTTAGTGTGGATGATCTTCAGATTCTTGTCCACGCTCTATCTTATGTGTATCAAAG  840
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2601  TGATTTTAGTGTGGATGATCTTCAGATTCTTGTCCACGCTCTATCTTATGTGTATCAAAG  2660

Query  841   AAGTACGACCGCAATCTCTTCAGTTGCACCAATAAACTATGCGCATCTAGCTGCGAGCCA  900
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2661  AAGTACGACCGCAATCTCTTCAGTTGCACCAATAAACTATGCGCATCTAGCTGCGAGCCA  2720

Query  901   GATGCAACAATTCCTCAAGGCAGAGGATCTTTCAGAAACAGCTTCGCGATCTGGAAAAGG  960
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2721  GATGCAACAATTCCTCAAGGCAGAGGATCTTTCAGAAACAGCTTCGCGATCTGGAAAAGG  2780

Query  961   GGAAGGGTCAGTTGCATCTGGAGGAGGAGGATACACTGCCCCTGTACCTGAACTCCCTGT  1020
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2781  GGAAGGGTCAGTTGCATCTGGAGGAGGAGGATACACTGCCCCTGTACCTGAACTCCCTGT  2840

Query  1021  GCTGCACCGAAATGTTTGCAACACCATGTTTTTCTGCTGA  1060
             ||||||||||||||||||||||||||||||||||||||||
Sbjct  2841  GCTGCACCGAAATGTTTGCAACACCATGTTTTTCTGCTGA  2880



Lambda      K        H
    1.33    0.621     1.12

Gapped
Lambda      K        H
    1.28    0.460    0.850

Effective search space used: 29540461433951


  Database: All GenBank+EMBL+DDBJ+PDB sequences (but no EST, STS,
GSS,environmental samples or phase 0, 1 or 2 HTGS sequences)
    Posted date:  Oct 3, 2009  5:42 PM
  Number of letters in database: 29,096,408,678
  Number of sequences in database:  10,077,905



Matrix: blastn matrix 1 -2
Gap Penalties: Existence: 0, Extension: 2.5
Notice that the information given to you on the command line is the exact same that the online tool gives you! In fact, in the web GUI, under Formatting options, you can opt to display alignments in the same way.

Slurm
Slurm is the program used by Hummingbird in order to allocate jobs on the server. With many people requesting to use the server simultaneously it is important to have a system like this. Slurm works by creating a text file ending with job_description.mpi and running the command sbatch feeding it the aforementioned text file.

A typical slurm file will look like the following:

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
This template will hardly ever have to be modified by yourselves. All the lines that start with #SBATCH tell the server things like how many CPUs and how much memory you want to use. You can put as many commands as you would like in a SLURM file the example I provided below has a single command blastn -query /hb/home/abagi/mystery_argonaute.fa -db /hb/home/abagi/db/nt/nt. This code, in particular, will run a blastn against a test fasta file. It will then output the text to the folder you called the script from and name it SLURM-job-xxxxx.out.

You can try this out yourself by running the following command sbatch /hb/home/abagi/bme110/slurm_intro/blastn_test.mpi. You can then see where you stand in the queue by using the command squeue.

The rule of thumb is if something is not instantaneous and will take more than a few seconds you should run the job through slurm or else you will get a nasty email from SOE.
