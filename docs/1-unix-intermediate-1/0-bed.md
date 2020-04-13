---
layout: default
title: Bed Files
parent: "Unix - Intermediate I"
nav_order: 0
---
# BED file format
Here we'll be working with a BED file to accomplish some basic tasks using standard Unix tools. Create a new directory in your home directory called `bme110` and a subdirectory inside it for discussion this week called `unix_tutorial`. Navigate into this directory and copy the file `/hb/home/abagi/bme110/unix_tutorial/table.bed` into it.

This is a BED file, a standard genome annotation format that is also used in the Genome Browser. Each line is an annotation. Typically refers to a gene, exon, whatever feature that can be mapped to specific bases in the genome.
* Examine the file with `cat` or `less -S`. The `-S` flag makes the `less` program disable word wrapping and enable left-right scrolling via the left and right arrow keys.
* Briefly, here are what the columns represent in a BED file:
    * A minimal BED file requires the first 3 columns, but we will generally use the first six columns (BED6) so we can include the "strand" information for direction of transcription.  
    * BED files that describe genes that have introns usually use 8 or 12 columns to distinguish between exons and introns.

1. Chromosome or scaffold
2. start position
3. end position
4. name - typically a gene
5. score (for genome browser, but you can do other stuff for fancier display)
6. strand
7. "thickStart": for fancier display, e.g. start codon
8. "thickEnd": also for fancier display
9. "itemRgb": more fancy display things
10. Number of blocks: This one is also meant for fancier display, but can also store some information.
11. Block start positions
12. Block end positions

This particular BED file contains annotations of human tRNA genes from chromosome 9 and 10, one per line, across all 12 columns (BED12) since some eukaryotic tRNAs contain introns. In this case, the blocks represent the number of exons and introns.  

You can view any other file formats in addition to BED at at [UCSC genome browser](https://genome.ucsc.edu/FAQ/FAQformat.html){:target="blank"}.
