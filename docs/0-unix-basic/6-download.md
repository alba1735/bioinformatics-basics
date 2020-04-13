---
layout: default
title: Downloading
parent: "Unix - Basic"
nav_order: 6
---
# Downloading files: `wget`

To download a file from a remote URL simply use the `wget {URL}` in the directory you wish to download to.

Example -- retrieve the set of human tRNAs (hg19) from the Genomic tRNA Database:

```
wget http://gtrnadb.ucsc.edu/genomes/eukaryota/Hsapi19/hg19-tRNAs.fa
```

* Use the `ls` and `less` commands to see the file `'hg19-tRNAs.fa'` that should now be in your current directory.
* Most text files you can view in your web browser (like the one above), you can generally grab using `wget` and then typing/copying the link.  This will be a quick way to get sequence files into your account to analyze with command line tools.
