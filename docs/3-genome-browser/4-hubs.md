---
layout: default
title: Track Hubs
parent: "Genome Browser"
nav_order: 3
---
# Creating Custom Track Hubs

Based on the instructions at https://genome.ucsc.edu/goldenPath/help/hgTrackHubHelp.html

We will first need to create a new directory to place all our files. We will create a folder in our home directory `mkdir testhub`, then `cd testhub` to enter that folder. We need to make a few files the most important is a the `hub.txt` file, we will create one by running `nano hub.txt` and enter the following text:

```
hub gtRNAdb_tRNAs
shortLabel Alexs TrackHub
longLabel Alexs TrackHub
genomesFile genomes.txt
email abagi@ucsc.edu
```

 We will also need to make a `genomes.txt` with the following:

 ```
genome hg19
trackDb hg19/trackDb.txt
```

Next we will make a folder for the corresponding genome `mkdir hg19`. We will then go into that folder `cd hg19`. In the genomes folders we need a document to tell which tracks we plan to use and what they will contain this is called `trackDb.txt`. Right now we don't have any custom tracks so we will make a blank document, this can easily be done with `touch trackDb.txt` which will make a blank file (we will add the track info later).

We can use the SNP information from earlier for our first track we can download the file by running the command `wget http://gtrnadb.ucsc.edu/genomes/eukaryota/Hsapi19/hg19-tRNAs.bed`. We first however need the bed file in the bigBed format otherwise the track hub will not read it. To do that we will do the following:

[bigBed Track Format](https://genome.ucsc.edu/goldenPath/help/bigBed.html)

1. `sort -k1,1 -k2,2n hg19-tRNAs.bed > temp.bed`
  * This will sort the file so it is ready to be converted
2. We need to remove the track information. (In this case there isn't any so we can skip this)
3. We need to install `bedToBigBed`. I have already done this for you but you can find instructions in the link above.
4. You will need a copy of the chr sizes for hg19 which we can find at https://hgdownload.soe.ucsc.edu/downloads.html.
  * `wget https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.chrom.sizes`
5. We need to now convert the files `bedToBigBed temp.bed hg19.chrom.sizes hg19-tRNAs.bb`


Now that we have our first track what do we add to the trackDb file:

```
track hg19tRNAs
bigDataUrl hg19-tRNAs.bb
shortLabel gtRNAdb tRNAs
longLabel gtRNAdb Hg19 tRNAs
type bigBed 12
```

Now with all our files in place we need to place it in a directory that is publicly accessible to html.

* If you have a SOE account or are an engineering student you can login to one of the SOE servers (such as `waterdance.soe.ucsc.edu`) and create a folder in your home directory called `.html`. You can then make a folder inside this called `pub` and run the command `chmod 755 pub` to make it available to anyone. You can then place the trackhub folder inside this and reach it at the url `https://users.soe.ucsc.edu/~<cruzid>/pub/testhub/hub.txt`.
  * **WARNING:** anything inside this `pub` folder is visible to everyone on the internet.
* Your lab may also have a publicly available directory for placing trackhubs on their own server.
* Their are also options to use Github, or cloud storage (Google Drive, Dropbox, etc.) explained [here](https://genome.ucsc.edu/goldenPath/help/hgTrackHubHelp.html#Hosting)
