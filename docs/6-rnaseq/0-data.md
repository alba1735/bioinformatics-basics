---
layout: default
title: Obtaining Data
parent: "RNA Sequencing Analysis"
nav_order: 0
---
# RNA Sequencing Analysis

Adapted from Andrew Holmes's RNA-Seq tutorial for BME110.
{: .fs-6 .fw-300 }

## Overview

We will do a reanalysis of RNA-Seq data from this [study](https://doi.org/10.1016/j.celrep.2015.07.043)

Oxidative stress that originates from reactive oxygen species (ROS) is an inevitable consequence of aerobic respiration in bacteria. Three transcription factors (TFs), OxyR, SoxR, and SoxS play a critical role in transcriptional regulation of the defense system.
{: .pl-4 }

The researchers in this study performed RNA-Seq on wild type (WT) and a SoxS knockout strain. We will compare transcript expression between WT and ΔSoxS RNA-Seq runs, and see which genes are differentially expressed.

Here's an overview of what your workflow will be like today.

* Grab the genome (FASTA).
* Grab the genes (GTF).
* Grab the reads (FASTQ).
* Align the reads to the genome (BAM).
* Get genome coverage (bedGraph).
* Quantify reads and perform differential expression testing.

![]({{ '/assets/img/rnaseq/workflow.png' | relative_url }})

If you need to stop in the middle of this, be sure to go to your history and name it something so that you can find it again later.

### Genome

First, you'll need to grab the right genome assembly and gene annotation matching that genome assembly. The [archaeal genome browser](http://archaea.ucsc.edu/)  has an annotated genome for *E. coli K12*, so we'll use that. Go there and find the *E. coli K12* genome.

![]({{ '/assets/img/rnaseq/archaeal-browser.png' | relative_url }})

Click &quot;Go to description&quot;, scroll down, and find the NCBI RefSeq Accession. Note the genome length here is 4639675.

![]({{ '/assets/img/rnaseq/accession.png' | relative_url }})

![]({{ '/assets/img/rnaseq/assembly1.png' | relative_url }})

The page SAYS *E. coli K12*, but if you look at the genome size, it says 4641652 bp. Turns out this corresponds to a newer assembly of the genome. It also happens to be the one that the study used, so we'll go with that one. Search &quot;NC_000913.2&quot; in the search bar. Then download that assembly by clicking &quot;Send to:&quot;, selecting File, and choosing FASTA format. Then click &quot;Create File&quot;. It will download to your computer.

![]({{ '/assets/img/rnaseq/assembly2.png' | relative_url }})

Now fix the genome name. We want it to match up with the browser annotation, which lists the genome as &quot;chr&quot;. Open up the genome in a file editor (NOT NOTEPAD. DO NOT USE NOTEPAD. BECAUSE WINDOWS SUCKS), change the sequence name to &quot;chr&quot;, save the changes, then upload the file to Galaxy. Make sure you select the right Genome by searching for &quot;Escherichia coli K12&quot;.

![]({{ '/assets/img/rnaseq/fix.png' | relative_url }})

### Genes

Now let's grab the genes. This one is a little easier. Go back to the Archaeal Genome Browser, select *E. coli K12*, and go to the Table Browser. Select the genes and switch output format to &quot;GTF - gene transfer format&quot;. Send it to Galaxy (make sure the &quot;Send output to Galaxy box is checked&quot;).

![]({{ '/assets/img/rnaseq/genes.png' | relative_url }})

By the way, this is what your GTF file should look like. There should be 4,294 in &quot;item count&quot; from the summary statistics in the Table Browser and 17,176 lines in the GTF file. 17,176 is 4,294 times 4 (CDs, start codon, stop codon, exon).

![]({{ '/assets/img/rnaseq/gtf.png' | relative_url }})

If you download instead of sending to Galaxy, make sure to select the right species like you did for genome above.

### Reads

This part is a little finnicky. You'll have to get two sets of paired end reads, which means 4 files total. In Galaxy, under Tools, go to Get Data &gt; EBI SRA. SRA stands for Sequence Read Archive, which contains all reads ever sequenced. (Not really, but it's the closest you'll ever get to it.) Once you get there, type `SRR1796599` into the search box. Here, you'll get the wild type *E. coli* RNA-Seq reads in compressed FASTQ format. Click on the link under &quot;Run&quot;.

![]({{ '/assets/img/rnaseq/sra1.png' | relative_url }})

Scroll down and click &quot;File 1&quot; under &quot;FASTQ Files (Galaxy)&quot;. It will take you back to Galaxy with the file loaded in.

![]({{ '/assets/img/rnaseq/sra2.png' | relative_url }})

![]({{ '/assets/img/rnaseq/sra3.png' | relative_url }})

While you're waiting for it to process, go back to the EBI SRA page, grab &quot;File 2&quot;, and send that to Galaxy too. Then go download the other two files for the ΔSoxS reads using the accession `SRR1796605`. Again, you should have a total of 4 files. You need to edit the attributes for all of the files in a couple of ways. First check what Galaxy has listed as its filetype. **If it's &quot;fastqsanger&quot;, skip the next couple of steps and go to Mapping reads. If it's &quot;fastq.gz&quot;, follow these steps to convert it to &quot;fastqsanger&quot;.** Convert the reads into FASTQ by editing the attributes and switching to the Convert tab:

![]({{ '/assets/img/rnaseq/convert.png' | relative_url }})

Do this for all four reads files, while keeping track of which is which. This is a good time to rename your files to something descriptive, e.g. &quot;WT reads 1 &quot; and &quot;SoxS reads 1&quot;. Then change the file types to &quot;fastqsanger&quot;. Edit attributes for the four reads files you just converted, click the Datatypes tab, and change the datatype to &quot;fastqsanger&quot;, and click &quot;Change datatype&quot;.

![]({{ '/assets/img/rnaseq/fastqsanger.png' | relative_url }})
