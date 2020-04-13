---
layout: default
title: Using Galaxy
parent: "RNA Sequencing Analysis"
nav_order: 2
---
# The Galaxy Method

## Mapping reads

We are going to use Bowtie2 to map reads to the genome. It's part of a genome analysis toolkit developed by Steven Salzberg's lab which includes tools like Bowtie, TopHat, Cufflinks, etc. This guy is famous enough to have his own [Wikipedia page](https://en.wikipedia.org/wiki/Steven_Salzberg). To map reads, the files bowtie uses need to be in the right format. Select NGS: Mapping &gt; Bowtie2 from the Tools column and change the settings to match.

* Paired end library
* FASTQ files #1 and #2 set to your SRA FASTQ reads
* Do not write reads to separate files - we want all of the aligned reads in the same file
* Use a genome from history and build index, use the *E. coli* genome you uploaded
* Feel free to add mapping stats too

![](/assets/img/rnaseq/bowtie.png)

Hit Execute. This step will take a while, especially since you need to do this for both WT and ΔSoxS reads. Again, rename it to something descriptive.

## Get coverage track onto the Genome Browser

Select BEDTools &gt; Genome Coverage. Choose Input Type as BAM, and then select your BAM file that you just generated from bowtie2.

![](/assets/img/rnaseq/coverage.png)

Then convert it to bigWig format. This is also a file type that describes genome coverage, except it's basically only used for fast visualization on the Genome Browser. Welcome to the world of bioinformatics, land of too many file formats and broken programs. Go to the Convert tab again and change it to a BigWig file. You should end up with two bigWig files. Name these something appropriate. Afterwards, you'll be able to view it in the Genome Browser. Example your bigWig file like below and it'll load your reads onto the Genome Browser. Do this for both of your coverage files. Here's what my browser looks like after moving my new tracks to the top and setting display size to full.

![](/assets/img/rnaseq/browser1.png)

![](/assets/img/rnaseq/browser2.png)

## Test genes for differential expression between WT and ΔSoxS conditions

We will use Cuffdiff to quantify reads. What this does compare the number of reads at a gene in one condition (in this case, WT) versus the number of reads at the gene in another condition (in this case, ΔSoxS). The idea is that under different conditions, cells will regulate gene expression differently. You can find it at NGS: RNA Analysis &gt; Cuffdiff. Set your transcript set to the list of genes in GTF format. For Input data, input the mapped WT reads (BAM file) in one condition and the ΔSoxS reads in the other condition.

![](/assets/img/rnaseq/cuffdiff.png)

Once you click submit, Cuffdiff will give you a LOT of different analysis files. One of them should end in &quot;gene differential expression testing&quot;. This one contains the list of *E. coli* genes, annotated by their fold change and p-value. Sort this file (use Text Manipulation &gt; Sort) by q-value (column 13) so that you can get a list of genes ordered by significance. You'll also need to set sort mode to &quot;general numeric&quot; because there's scientific notation.

Using gene_id, look up a few of the top differentially expressed genes. Does it make sense that these genes are being upregulated or downregulated? Keep in mind that stress response affects an extremely wide range of regulatory pathways.
