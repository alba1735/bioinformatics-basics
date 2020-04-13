---
layout: default
title: Intersections
parent: "Genome Browser"
nav_order: 1
---
# Intersections

## Create intersections to focus in on what's really important

A lot of these SNPs don't overlap genes, and a lot of these SNPs are rare and unstudied. First, let's filter for the ones that overlap genes. Go to Tools -> Table Browser. Find "intersection" and create one.

![]({{ '/assets/img/genome-browser/intersect-1.png' | relative_url }})

Luckily, the defaults will work great in order to filter all the entries that aren't overlapping genes! Hit submit to back to the main Table Browser page. Change "output format" to "custom track" instead of BED. Hit get output. You can rename this custom track to something like:

![]({{ '/assets/img/genome-browser/intersect-2.png' | relative_url }})

Then click "get custom track in genome browser". You should have a new track loaded at the top. Mine is called "Intersection between Luke SNPs and genes".

![]({{ '/assets/img/genome-browser/intersect-3.png' | relative_url }})

Go back to Tools -> Table Browser. Let's look at summary statistics for a quick second here. Confirm that group is "Custom Tracks" and track is Luke_SNPs, hit clear on the intersection (we don't want to intersect, we just want to look at stats), then hit summary/statistics at the bottom. What is the item count here? These correspond to SNPs.

Go back and change "Track" to the track you just loaded. Mine is called "Luke coding SNPs". Click summary/statistics. What is the item count? Notice that there are a lot less "Items" now - seems like the vast majority of SNPs were occurring in noncoding regions!

Now we're going to intersect (a) well-studied SNPS with entries in SNPedia with (b) the intersection between the SNP data and genes, which you already have. Select the old intersection (mine is called "Luke coding SNPs"). Create a new intersection. For group, select "Phenotype and Literature", and for track, choose "SNPedia". Under table, choose "SNPedia with text (snpediaText)". Then hit submit.

![]({{ '/assets/img/genome-browser/intersect-4.png' | relative_url }})

Output it as a custom track and view it in the genome browser. Again, rename the track to something more descriptive, e.g.,

![]({{ '/assets/img/genome-browser/intersect-5.png' | relative_url }})
