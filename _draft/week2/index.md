Discussion Week 2: More UNIX and Advanced Genome Browsing Copy
BME 110 Week 2: Intermediate Unix and Genome Browser
BED file format
More Unix tools
wc
cut
grep
sed
Redirecting output and piping
The Unix Chainsaw
What makes Luke Skywalker so strong with the Force?
Upload a custom track
Create intersections to focus in on what's really important
Exploring the data
Problem set
BME 110 Week 2: Intermediate Unix and Genome Browser
These notes are not a replacement for attending discussion - we'll go over more things than are written down here.

During discussion, you'll have more opportunities to practice using the tools and databases you learn about in lecture. Some tools are very specific and do one specific task very well and very efficiently (e.g., grep and sort). Other tools are more like pipelines in that they combine a lot of tasks together to do a larger task.

You won't learn how to program per se, but you will learn how to use basic tools, become more comfortable with specialized tools and pipelines, and understand why we use these more specialized tools. Computational biology requires a lot of data munging before you can even use most tools. For the first couple of weeks, we will be doing a crash course in Unix with toy examples. This will be hard. It's literally learning a second language. In later weeks, you'll work on some more exciting projects.

BED file format
Here we'll be working with a BED file to accomplish some basic tasks using standard Unix tools. Create a new directory in your home directory called bme110 and a subdirectory inside it for discussion this week called unix_tutorial. Navigate into this directory and copy the file /hb/home/abagi/bme110/unix_tutorial/table.bed into it.

This is a BED file, a standard genome annotation format that is also used in the Genome Browser. Each line is an annotation. Typically refers to a gene, exon, whatever feature that can be mapped to specific bases in the genome. Examine the file with cat or less -S. The -S flag makes the less program disable word wrapping and enable left-right scrolling via the left and right arrow keys. Briefly, here are what the columns represent in a BED file.  A minimal BED file requires the first 3 columns, but we will generally use the first six columns (BED6) so we can include the "strand" information for direction of transcription.  BED files that describe genes that have introns usually use 8 or 12 columns to distinguish between exons and introns.

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

You can view any other file formats in addition to BED at https://genome.ucsc.edu/FAQ/FAQformat.htmlLinks to an external site.

More Unix tools
wc
How many lines, words, and characters are in this file? Use wc to find out. We can find the number of tRNA genes on chromosomes 9 and 10 without having to manually count. This is really useful for huge files.

[abagi@hummingbird unix_tutorial]$ wc table.bed
  17  202 1332 table.bed
You can also just get a count of the number of lines alone with the -l option.

[abagi@hummingbird unix_tutorial]$ wc -l table.bed
17 table.bed
cut
Suppose you want to get just the tRNA gene names from this file, and you don't care about the rest. This is what cut will do: it treats your file has a series of columns delimited by tab characters and pulls out the columns you specify.

The syntax is cut -f {column number} {file}. The -f option stands for "field", and requires that you enter an integer column number after it. Try it now on this BED file. The gene names are on column 4, so the command is:

[abagi@hummingbird unix_tutorial]$ cut -f 4 table.bed
chr9.tRNA1-MetCAT
chr9.tRNA7-LeuCAG
chr9.tRNA5-ArgTCG
chr10.tRNA5-AsnGTT
chr9.tRNA9-HisGTG
chr9.tRNA8-AspGTC
chr10.tRNA1-ProGGG
chr10.tRNA4-LeuCAA
chr9.tRNA4-TyrGTA
chr10.tRNA2-SerTGA
chr9.tRNA6-ArgTCT
chr10.tRNA7-ValTAC
chr10.tRNA6-GlnCTG
chr9.tRNA10-TyrGTA
chr9.tRNA2-TyrATA
chr9.tRNA3-LeuCAG
chr10.tRNA3-TyrGTA
You can also specify alternative delimiters using the -d switch like so: cut -f 4 -d ' ' table.bed. Here, this command specifies that the delimiter is a space, instead of a tab.

grep
grep is a very handy tool to filter for lines in a file that you want. The syntax is: grep "{search token}" {filename}. So suppose we want to get all of the tRNA genes in this file that are on the plus (+) strand.

[abagi@hummingbird unix_tutorial]$ grep "+" table.bed
chrom9  19403995    19404070    chr9.tRNA1-MetCAT   1000    +   19403995    19404070    0   1   75, 0,
chrom9  112960802   112960875   chr9.tRNA5-ArgTCG   1000    +   112960802   112960875   0   1   73, 0,
chrom10 22852578    22852651    chr10.tRNA1-ProGGG  1000    +   22852578    22852651    0   1   73, 0,
chrom9  95301479    95301545    chr9.tRNA4-TyrGTA   1000    +   95301479    95301545    0   1   66, 0,
chrom10 69524260    69524342    chr10.tRNA2-SerTGA  1000    +   69524260    69524342    0   1   82, 0,
chrom9  83179560    83179624    chr9.tRNA2-TyrATA   1000    +   83179560    83179624    0   1   64, 0,
chrom9  86861414    86861474    chr9.tRNA3-LeuCAG   1000    +   86861414    86861474    0   1   60, 0,
chrom10 71352696    71352762    chr10.tRNA3-TyrGTA  1000    +   71352696    71352762    0   1   66, 0,
grep is actually a very powerful tool, and here are some more highlights of what you can do.

Filtering out all the plus strand genes: use the -v option.

[abagi@hummingbird unix_tutorial]$ grep -v "+" table.bed
chrom9  123117352   123117435   chr9.tRNA7-LeuCAG   1000    -   123117352   123117435   0   1   83, 0,
chrom10 22518437    22518511    chr10.tRNA5-AsnGTT  1000    -   22518437    22518511    0   1   74, 0,
chrom9  14433937    14434009    chr9.tRNA9-HisGTG   1000    -   14433937    14434009    0   1   72, 0,
chrom9  77517989    77518061    chr9.tRNA8-AspGTC   1000    -   77517989    77518061    0   1   72, 0,
chrom10 34591415    34591483    chr10.tRNA4-LeuCAA  1000    -   34591415    34591483    0   1   68, 0,
chrom9  131102354   131102445   chr9.tRNA6-ArgTCT   1000    -   131102354   131102445   0   2   36,37,  0,54,
chrom10 5895673 5895746 chr10.tRNA7-ValTAC  1000    -   5895673 5895746 0   1   73,0,
chrom10 20036617    20036674    chr10.tRNA6-GlnCTG  1000    -   20036617    20036674    0   1   57, 0,
chrom9  5096586 5096652 chr9.tRNA10-TyrGTA  1000    -   5096586 5096652 0   1   66,0,
Include line numbers in your output so you can find them later: use the -n option.

[abagi@hummingbird unix_tutorial]$ grep -nv "+" table.bed
2:chrom9    123117352   123117435   chr9.tRNA7-LeuCAG   1000    -   123117352   123117435   0   1   83, 0,
4:chrom10   22518437    22518511    chr10.tRNA5-AsnGTT  1000    -   22518437    22518511    0   1   74, 0,
5:chrom9    14433937    14434009    chr9.tRNA9-HisGTG   1000    -   14433937    14434009    0   1   72, 0,
6:chrom9    77517989    77518061    chr9.tRNA8-AspGTC   1000    -   77517989    77518061    0   1   72, 0,
8:chrom10   34591415    34591483    chr10.tRNA4-LeuCAA  1000    -   34591415    34591483    0   1   68, 0,
11:chrom9   131102354   131102445   chr9.tRNA6-ArgTCT   1000    -   131102354   131102445   0   2   36,37,  0,54,
12:chrom10  5895673 5895746 chr10.tRNA7-ValTAC  1000    -   5895673 5895746 0   1   73,0,
13:chrom10  20036617    20036674    chr10.tRNA6-GlnCTG  1000    -   20036617    20036674    0   1   57, 0,
14:chrom9   5096586 5096652 chr9.tRNA10-TyrGTA  1000    -   5096586 5096652 0   1   66,0,
Count the number of leucine tRNA genes: use the -c option. Also, try it without the -c option and count the rows to confirm that it's working.

[abagi@hummingbird unix_tutorial]$ grep -c "Leu" table.bed
3
sed
sed is a very powerful tool with a complicated syntax. I'm going to just one: find and replace, for which the syntax is sed 's/[find]/[replace]/' [filename]. What this does is take each line in the file, find the first instance of [find], and replace it with [replace]. There are some limitations that have to do with metacharacters. We won't go too much into metacharacters right now, but basically, avoid weird characters like "  ", " ` " (backtick), " / ", " $ ", " * " etc.

Why is this useful? Well, what you'll notice is that each entry in the BED file is marked by which chromosome it's on, like "chrom1" or "chrom6". This is totally incompatible with the Genome Browser, which uses "chr1" and "chr6". A textbook example for find and replace!

[abagi@hummingbird unix_tutorial]$ sed 's/chrom/chr/' table.bed
chr9    19403995    19404070    chr9.tRNA1-MetCAT   1000    +   19403995    19404070    0   1   75, 0,
chr9    123117352   123117435   chr9.tRNA7-LeuCAG   1000    -   123117352   123117435   0   1   83, 0,
chr9    112960802   112960875   chr9.tRNA5-ArgTCG   1000    +   112960802   112960875   0   1   73, 0,
chr10   22518437    22518511    chr10.tRNA5-AsnGTT  1000    -   22518437    22518511    0   1   74, 0,
chr9    14433937    14434009    chr9.tRNA9-HisGTG   1000    -   14433937    14434009    0   1   72, 0,
chr9    77517989    77518061    chr9.tRNA8-AspGTC   1000    -   77517989    77518061    0   1   72, 0,
chr10   22852578    22852651    chr10.tRNA1-ProGGG  1000    +   22852578    22852651    0   1   73, 0,
chr10   34591415    34591483    chr10.tRNA4-LeuCAA  1000    -   34591415    34591483    0   1   68, 0,
chr9    95301479    95301545    chr9.tRNA4-TyrGTA   1000    +   95301479    95301545    0   1   66, 0,
chr10   69524260    69524342    chr10.tRNA2-SerTGA  1000    +   69524260    69524342    0   1   82, 0,
chr9    131102354   131102445   chr9.tRNA6-ArgTCT   1000    -   131102354   131102445   0   2   36,37,  0,54,
chr10   5895673 5895746 chr10.tRNA7-ValTAC  1000    -   5895673 5895746 0   1   73,0,
chr10   20036617    20036674    chr10.tRNA6-GlnCTG  1000    -   20036617    20036674    0   1   57, 0,
chr9    5096586 5096652 chr9.tRNA10-TyrGTA  1000    -   5096586 5096652 0   1   66,0,
chr9    83179560    83179624    chr9.tRNA2-TyrATA   1000    +   83179560    83179624    0   1   64, 0,
chr9    86861414    86861474    chr9.tRNA3-LeuCAG   1000    +   86861414    86861474    0   1   60, 0,
chr10   71352696    71352762    chr10.tRNA3-TyrGTA  1000    +   71352696    71352762    0   1   66, 0,
This only replaces the first instance of "chrom" on each line. If there are multiple instances, you would add a single "g" like so: sed 's/[find]/[replace]/g' [filename].

You won't always want to replace everything in the line. What if you had a BED file from an octopus chromatophore cell? Then your gene names might look like "octopus_chromatophore.chrom2.tRNA8-GlyGCC", and a universal find and replace would give you "octopus_chratophore.chr2.tRNA8-GlyGCC", when what you really want is "octopus_chromatophore.chr2.tRNA8-GlyCCC.

Redirecting output and piping
Suppose you want to save this output. All the programs you've run so far have their output displayed in your terminal. This is called "writing to standard output", or stdout. Standard output is displayed on your screen.

There are two other standard directions. One is standard input, stdin which programs can use to take in data and adjust their runtime accordingly. The other is standard error, stderr which is also displayed on your screen, but is not output, and is generally used for printing status or error messages. Many times, programs will require that data be fed through standard input, but at other times programs will require actual filenames. Sometimes, they'll even need both. It's not always consistent and is a large part of learning to use computational biology tools.

You can redirect stdout and stdin into a file by using >. For now, we'll just practice with stdout.

Suppose you want to only look at all of the tRNAs on the plus ("+") strand, but also save it to a file so you don't have to keep redoing the same command, or because you want to feed it into another program that requires a file input. To do this, the syntax is: {normal command} > {filename}. Here's my example below:

[abagi@hummingbird unix_tutorial]$ grep "+" table.bed > plus-tRNAs.bed
Do this and examine your new bed file to make sure it worked. If it prints output, it didn't work!

The Unix Chainsaw
Now that you've learned quite a few commands, a central feature of Unix is that you can chain a lot of these commands together.

Suppose you have a slightly more complex problem: you want to count the number of Type II tRNAs (serine or leucine) that are on the plus strand of chromosome 9. One way you could do this is by doing it separately with single commands, and saving it to files:

grep "Ser" table.bed > Ser-tRNAs.bed
grep "chr10" Ser-tRNAs.bed > Ser-chr10-tRNAs.bed
grep -c "+" Ser-chr10-tRNAs.bed
And you'd have to repeat this for leucine tRNAs. Here, it's a small file so you could plausibly count it manually, but what if you had to do this for chromosome 1, which contains a lot more tRNAs? In either case, you can save a lot of time by using the pipe operator.

The pipe (|, above the Enter key) lets you take Unix commands and chain them together. So here is how you could do it with piping:

grep "Ser" table.bed | grep "chr10" | grep "+" | wc -l
grep "Leu" table.bed | grep "chr9" | grep "+" | wc -l
One thing you'll notice is that there are many, many ways to do the same things. Once you're good enough at Unix, being able to do tasks in multiple ways is a mark of mastery! Here are some examples that you can already do.

Copying a file: cp file1 file2 and cat file1 > file2
Word counting: wc -l myfile and grep -c "" myfile
What makes Luke Skywalker so strong with the Force?
Here, we're going to look at a panel of Luke Skywalker's SNPs to see if there's a genetic basis for his being strong with the Force.

I've included screencaps of what you should be seeing here. This won't display in Canvas, but it will display hereLinks to an external site..

Upload a custom track
To do this, we'll upload a custom track to the genome. Go to the genome browser, and reset all tracks to the default view (go to View -> Reset All User Settings). Make sure you are on hg19 and not hg38! It should look somewhat like this:


Click on My Data -> Custom Tracks.


Paste this URL into the upload section: https://users.soe.ucsc.edu/~blin/pub/bme110-w18/Luke.pgSnp. Here is a successful track upload.


Click "Go", and zoom out to a 200 kb region. You should be able to now see the SNPs loaded in under a track titled "SNP data for Luke Skywalker".


Create intersections to focus in on what's really important
A lot of these SNPs don't overlap genes, and a lot of these SNPs are rare and unstudied. First, let's filter for the ones that overlap genes. Go to Tools -> Table Browser. Find "intersection" and create one.


Luckily, the defaults will work great in order to filter all the entries that aren't overlapping genes! Hit submit to back to the main Table Browser page. Change "output format" to "custom track" instead of BED. Hit get output. You can rename this custom track to something like:


Then click "get custom track in genome browser". You should have a new track loaded at the top. Mine is called "Intersection between Luke SNPs and genes".


Go back to Tools -> Table Browser. Let's look at summary statistics for a quick second here. Confirm that group is "Custom Tracks" and track is Luke_SNPs, hit clear on the intersection (we don't want to intersect, we just want to look at stats), then hit summary/statistics at the bottom. What is the item count here? These correspond to SNPs.

Go back and change "Track" to the track you just loaded. Mine is called "Luke coding SNPs". Click summary/statistics. What is the item count? Notice that there are a lot less "Items" now - seems like the vast majority of SNPs were occuring in noncoding regions!

Now we're going to intersect (a) well-studied SNPS with entries in SNPedia with (b) the intersection between the SNP data and genes, which you already have. Select the old intersection (mine is called "Luke coding SNPs"). Create a new intersection. For group, select "Phenotype and Literature", and for track, choose "SNPedia". Under table, choose "SNPedia with text (snpediaText)". Then hit submit.


Output it as a custom track and view it in the genome browser. Again, rename the track to something more descriptive, e.g.,


Exploring the data
Go back to the Genome Browser. You should see a small line for your new track at the top. It might have no data in it - this is because you need to zoom out to search for SNPs part of this 3 way intersection. Scroll down and turn on the SNPedia track (or just ctrl+F). Reconfigure your browser settings so that you can see a few tracks at once. To do this, right click on the gray bar on the left side and adjust the view settings to "dense" when a track gets too large. You can also do this down below where all the tracks are listed. I recommend setting the raw custom track data (SNPs) to "dense" and the first intersection (genes and SNPs) to "hide". Drag the SNPedia tracks to the top via the gray bar. What will actually help quite a bit is if you turn off one of the SNPedia tracks by clicking on its gray bar and unchecking the "SNPedia all" box, then hitting "submit":


Navigate to the range chr1:11,000,000-12,000,000. You can do this by typing it into the search bar. After all of that, here's what my screen looks like.


Zoom in on the last SNP in this screen within the three-way intersection track. You can do this by shift clicking + dragging on the window. Make the viewing window less than 2000 bp. Click on the actual text and line for this SNP within the SNPedia track. In other words, click on the text rs632793. It should take you to the page detail, which looks like this:


Click on the Link to SNPedia page and read more about this SNP. Does this correspond to a common genotype?

Now find the another SNP within the three-way intersection track. Click back on the browser or reinput chr1:11,000,000-12,000,000 into the bar. Does this correspond to a common genotype?
