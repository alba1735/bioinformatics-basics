Discussion Week 3: Bedtools, BLAST, and Slurm
BME 110 Week 3: BEDTools and BLAST
BEDTools
Running BEDTools
BEDTools syntax
Finding intersections with BEDTools
BLAST
Using BLAST
Command line BLAST
Slurm
Galaxy setup
BME 110 Week 3: BEDTools and BLAST
BEDTools
What happens when you run a query on the Table Browser? You could assume it's magic - or you could assume that someone wrote a program to parse and calculate what you told the Table Browser to do.

Under the hood, the Table Browser has a lot of programs, but most of them are focused on slicing and dicing BED files in different ways. Enter BEDTools. From the BEDTools docs:

Collectively, the bedtools utilities are a swiss-army knife of tools for a wide-range of genomics analysis tasks ... bedtools allows one to intersect, merge, count, complement, and shuffle genomic intervals from multiple files in widely-used genomic file formats ... While each individual tool is designed to do a relatively simple task (e.g., intersect two interval files), quite sophisticated analyses can be conducted by combining multiple bedtools operations on the UNIX command line.

Running BEDTools
I have installed the program on Hummingbird. The program is located in my home directory. Login to Hummingbird and type /hb/home/abagi/bin/bedtools. You should get the help pages on how to run BEDTools:

[abagi@hummingbird ~]$ /hb/home/abagi/bin/bedtools
bedtools: flexible tools for genome arithmetic and DNA sequence analysis.
usage:    bedtools <subcommand> [options]

The bedtools sub-commands include:

[ Genome arithmetic ]
    intersect     Find overlapping intervals in various ways.
    window        Find overlapping intervals within a window around an interval.
    closest       Find the closest, potentially non-overlapping interval.
    coverage      Compute the coverage over defined intervals.
    map           Apply a function to a column for each overlapping interval.
    genomecov     Compute the coverage over an entire genome.
    merge         Combine overlapping/nearby intervals into a single interval.
    cluster       Cluster (but don't merge) overlapping/nearby intervals.
...
Remember, the Unix syntax requires you to write a program first. When you specify /hb/home/abagi/bin/bedtools, you are telling the computer to look in the folder /hb/home/abagi/bin/ for a program called bedtools.

OPTION 1: Hummingbird has a local BIN folder in your path
How do you run BEDTools without typing in the whole path every time? You can update your PATH. In Unix, the PATH environment variable is a list of folders that the computer searches for programs in - essentially, it tells the computer what programs you can run from anywhere. When you login, Bash will set up a lot of default options, including your PATH variable. Type echo $PATH. echo is a program that essentially prints what you type back to you, and $PATH is how you access the PATH environment variable. (The $ means that you're trying to echo a variable and not the actual word "PATH".)

By default, Hummingbird adds /hb/home/<cruzid>/bin/ to your path. This means that any software you place in this folder will automatically be loaded into your path. I have setup the software you will need today for you and saved you several steps. Run the following commands to copy the software into your home directory and also into your path.

[abagi@hummingbird ~]$ mkdir ~/bin
[abagi@hummingbird ~]$ cp /hb/home/abagi/bin/* ~/bin/.

You should also run the following command and make sure your .bash_profile is setup the same way.

[abagi@hummingbird ~]$ cat ~/.bash_profile
# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
If your profile does not contain PATH=$PATH:$HOME/.local/bin:$HOME/bin you must add that using nano or vi/vim.

OPTION 2: Editing your PATH to run BEDTools from anywhere
Hummingbird seems to randomly assign you a preferred shell. The below steps may not work for you. Here's how to find out if it does work. After logging in, type echo $0 into your terminal.

[abagi@hummingbird ~]$ echo $0
-bash
If the terminal prints -bash, the steps will work. Otherwise, you're out of luck. Use the entire path /hb/home/abagi/bin/bedtools for this section and for future assignments.

To add this installation of BEDtools to your PATH, you have a couple of options:

Every time you log in, type: PATH=$PATH:/hb/home/abagi/bin/. You will have to do this every time you log in.
When you log in, Bash automatically runs a program called .bash_profile - this is a hidden preferences file in your home directory. Edit this file to include PATH=$PATH:/hb/home/abagi/bin/ so it's automatically PATH'd each time you log in.
I highly recommend that you execute either of the following steps during discussion or office hours where I can troubleshoot problems for you.
Option 1: append it directly to .bash_profile by typing: echo 'PATH=$PATH:/hb/home/abagi/bin:' >> .bash_profile. >> means to redirect output, but don't overwrite the existing file like > does.
Option 2: Open the file using an editor like nano, vi, or emacs, and append /hb/home/abagi/bin: to the end of the line that starts with "PATH"
Once you have done this, log out and log back in.
Once you've accomplished this, you can type bedtools at your prompt from any directory!

BEDTools syntax
When you run BEDTools with no options, you should see (as above):

[abagi@hummingbird ~]$ /hb/home/abagi/bin/bedtools
bedtools: flexible tools for genome arithmetic and DNA sequence analysis.
usage:    bedtools <subcommand> [options]
If you have correctly set up your PATH, you can just use:


[abagi@hummingbird ~]$ bedtools
bedtools: flexible tools for genome arithmetic and DNA sequence analysis.
usage:    bedtools <subcommand> [options]
First, it tells you the syntax: bedtools <subcommand> [options]. <subcommand> can take on many values: intersect, window, closest... each of these is a powerful program that can answer many biological questions. Essentially, bedtools is a wrapper program that you use to specify subprograms using this syntax.

Finding intersections with BEDTools
First, we're going to find intersections between Luke's SNPs and a custom tRNA set. To do this, let's look at how to use the BEDTools intersect tool by using the -h flag, short for help:

[abagi@hummingbird bedtools_intro]$ /hb/home/abagi/bin/bedtools intersect -h

Tool:    bedtools intersect (aka intersectBed)
Version: v2.25.0
Summary: Report overlaps between two feature files.

Usage:   bedtools intersect [OPTIONS] -a <bed/gff/vcf/bam> -b <bed/gff/vcf/bam>

    Note: -b may be followed with multiple databases and/or
    wildcard (*) character(s).
Options:
    -wa Write the original entry in A for each overlap.

    -wb Write the original entry in B for each overlap.
        - Useful for knowing _what_ A overlaps. Restricted by -f and -r.

    -loj    Perform a "left outer join". That is, for each feature in A
        report each overlap with B.  If no overlaps are found,
        report a NULL feature for B.
So you can see: the syntax is bedtools intersect [OPTIONS] -a <bed/gff/vcf/bam> -b <bed/gff/vcf/bam>. [OPTIONS] is optional, but the rest is not. We format our command as such:

bedtools intersect -a {BED file A} -b {BED file B}
Try this now. Inside your bme110 folder, create a new directory called bedtools_intro. Copy Luke's SNPs /hb/home/abagi/bme110/bedtools_intro/Luke.bed and a custom human tRNA BED file /hb/home/abagi/bme110/bedtools_intro/hg19-tRNAs.bed into this directory.

[abagi@hummingbird bedtools_intro]$ /hb/home/abagi/bin/bedtools intersect -a Luke.bed -b hg19-tRNAs.bed
chr1    55839116    55839117    G   1   1   0
chr6    26323100    26323101    C   1   1   0
chr6    27205421    27205422    C   1   1   0
chr6    27302824    27302825    G   1   1   0
chr6    27586180    27586181    G   1   1   0
chr6    27632580    27632581    G   1   1   0
chr6    28663715    28663716    G   1   1   0
chr6    28694895    28694896    G   1   1   0
chr7    149007343   149007344   G   1   1   0
chr12   74851232    74851233    G   1   1   0
Notice that I put Luke's SNPs as A and the tRNA file as B. This means that BEDTools will use Luke's SNPs as a basis for intersection - meaning that BEDTools performs the following process: For entry / line / row / SNP of Luke.bed,

Compare the start and end positions to all tRNA start and end positions
If any tRNAs overlap with this SNP, output the SNP
What if instead of knowing which SNPs overlap with tRNAs, you wanted to know which tRNAs overlap with SNPs?

[abagi@hummingbird bedtools_intro]$ /hb/home/abagi/bin/bedtools intersect -a hg19-tRNAs.bed -b Luke.bed
chr6    28663715    28663716    chr6.tRNA118-AlaCGC
chr6    27632580    27632581    chr6.tRNA56-PheGAA
chr6    27586180    27586181    chr6.tRNA54-ThrCGT
chr7    149007343   149007344   chr7.tRNA8-CysGCA
chr6    27302824    27302825    chr6.tRNA150-LysTTT
chr6    27205421    27205422    chr6.tRNA155-IleAAT
chr6    26323100    26323101    chr6.tRNA4-ArgTCG
chr6    28694895    28694896    chr6.tRNA117-PheGAA
chr12   74851232    74851233    chr12.tRNA3-GlnCTG
chr1    55839116    55839117    chr1.tRNA9-LeuTAA
Now we have a list of tRNAs that overlap with Luke's SNPs. Notice that the entries now are not in order like they were before. Why is this?

Also notice that the start and end ranges are one base long. This is because this new BED file lists the start and end positions of the intersection, and is no longer the annotation specified in the 4th column!!

Now that you have this, you can actually chain together some crazy Linux commands. For example:

How many tRNAs overlap with SNPs? bedtools intersect -a hg19-tRNAs.bed -b Luke.bed | wc -l
How many SNPs on chromosome 6 overlap with tRNAs? bedtools intersect -a Luke.bed -b hg19-tRNAs.bed | grep "chr6" | wc -l
You're now ready to do the first half of Problem Set 2, which will ask you to use more examples of using BEDTools with the Unix chainsaw.

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
