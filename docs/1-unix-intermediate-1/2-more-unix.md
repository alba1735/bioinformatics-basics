---
layout: default
title: More Unix Tools
parent: "Unix - Intermediate I"
nav_order: 1
---
# More Unix tools: `wc`, `cut`, `grep`, `sed`

## wc
How many lines, words, and characters are in this file? Use `wc` to find out. We can find the number of tRNA genes on chromosomes 9 and 10 without having to manually count. This is really useful for huge files.

```
[abagi@hummingbird unix_tutorial]$ wc table.bed
  17  202 1332 table.bed
```

You can also just get a count of the number of lines alone with the `-l` option.

```
[abagi@hummingbird unix_tutorial]$ wc -l table.bed
17 table.bed
```

## cut
Suppose you want to get just the tRNA gene names from this file, and you don't care about the rest. This is what `cut` will do: it treats your file has a series of columns delimited by **tab** (`\t`) characters and pulls out the columns you specify.

The syntax is `cut -f {column number} {file}`. The `-f` option stands for "field", and requires that you enter an integer column number after it. Try it now on this BED file. The gene names are on column 4, so the command is `cut -f 4 table.bed`.

```
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
```

You can also specify alternative delimiters using the `-d` switch like so: `cut -f 4 -d ' ' table.bed`. Here, this command specifies that the delimiter is a space, instead of a tab.

## grep

`grep` is a very handy tool to filter for lines in a file that you want. The syntax is: `grep "{search token}" {filename}`. So suppose we want to get all of the tRNA genes in this file that are on the plus (+) strand.

```
[abagi@hummingbird unix_tutorial]$ grep "+" table.bed
chrom9  19403995    19404070    chr9.tRNA1-MetCAT   1000    +   19403995    19404070    0   1   75, 0,
chrom9  112960802   112960875   chr9.tRNA5-ArgTCG   1000    +   112960802   112960875   0   1   73, 0,
chrom10 22852578    22852651    chr10.tRNA1-ProGGG  1000    +   22852578    22852651    0   1   73, 0,
chrom9  95301479    95301545    chr9.tRNA4-TyrGTA   1000    +   95301479    95301545    0   1   66, 0,
chrom10 69524260    69524342    chr10.tRNA2-SerTGA  1000    +   69524260    69524342    0   1   82, 0,
chrom9  83179560    83179624    chr9.tRNA2-TyrATA   1000    +   83179560    83179624    0   1   64, 0,
chrom9  86861414    86861474    chr9.tRNA3-LeuCAG   1000    +   86861414    86861474    0   1   60, 0,
chrom10 71352696    71352762    chr10.tRNA3-TyrGTA  1000    +   71352696    71352762    0   1   66, 0,
```

`grep` is actually a very powerful tool, and here are some more highlights of what you can do.
* Filtering out all the plus strand genes: use the `-v` option.

```
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
```

* Include line numbers in your output so you can find them later: use the `-n` option.

```
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
```

* Count the number of leucine tRNA genes: use the `-c` option. Also, try it without the `-c` option and count the rows to confirm that it's working.

```
[abagi@hummingbird unix_tutorial]$ grep -c "Leu" table.bed
3
```

## sed

`sed` is a very powerful tool with a complicated syntax. I'm going to just one: find and replace, for which the syntax is sed `'s/[find]/[replace]/' [filename]`.
* What this does is take each line in the file, find the first instance of [find], and replace it with [replace]. There are some limitations that have to do with metacharacters. We won't go too much into metacharacters right now, but basically, avoid weird characters like

```
"  ", " ` " (backtick), " / ", " $ ", " * " etc.
```

Why is this useful? Well, what you'll notice is that each entry in the BED file is marked by which chromosome it's on, like "chrom1" or "chrom6". This is totally incompatible with the Genome Browser, which uses "chr1" and "chr6". A textbook example for find and replace!

```
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
```

This only replaces the first instance of "chrom" on each line. If there are multiple instances, you would add a single "g" like so: `sed 's/[find]/[replace]/g' [filename]`.

You won't always want to replace *everything* in the line. What if you had a BED file from an octopus chromatophore cell? Then your gene names might look like "octopus_chromatophore.chrom2.tRNA8-GlyGCC", and a universal find and replace would give you "octopus_chratophore.chr2.tRNA8-GlyGCC", when what you really want is "octopus_chromatophore.chr2.tRNA8-GlyCCC.
