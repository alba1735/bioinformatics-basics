---
layout: default
title: Redirecting Output and Piping
parent: "Unix - Intermediate I"
nav_order: 2
---
# Redirecting output and piping

## stdin, and stdout

Suppose you want to save this output. All the programs you've run so far have their output displayed in your terminal. This is called "writing to standard output", or `stdout`. Standard output is displayed on your screen.

There are two other standard directions. One is standard input, **stdin** which programs can use to take in data and adjust their runtime accordingly. The other is standard error, **stderr** which is also displayed on your screen, but is not output, and is generally used for printing status or error messages. Many times, programs will require that data be fed through standard input, but at other times programs will require actual filenames. Sometimes, they'll even need both. It's not always consistent and is a large part of learning to use computational biology tools.

You can redirect **stdout** and **stdin** into a file by using `>`. For now, we'll just practice with **stdout**.

Suppose you want to only look at all of the tRNAs on the plus ("+") strand, but also save it to a file so you don't have to keep redoing the same command, or because you want to feed it into another program that requires a file input. To do this, the syntax is: `{normal command} > {filename}`. Here's my example below:

```
[abagi@hummingbird unix_tutorial]$ grep "+" table.bed > plus-tRNAs.bed
```

Do this and examine your new bed file to make sure it worked. If it prints output, it didn't work!

## The Unix Chainsaw

Now that you've learned quite a few commands, a central feature of Unix is that you can chain a lot of these commands together.

Suppose you have a slightly more complex problem:
* You want to count the number of Type II tRNAs (serine or leucine) that are on the plus strand of chromosome 9.
* One way you could do this is by doing it separately with single commands, and saving it to files:

```
grep "Ser" table.bed > Ser-tRNAs.bed
grep "chr10" Ser-tRNAs.bed > Ser-chr10-tRNAs.bed
grep -c "+" Ser-chr10-tRNAs.bed
```

You'd have to repeat this for leucine tRNAs. Here, it's a small file so you could plausibly count it manually, but what if you had to do this for chromosome 1, which contains a lot more tRNAs? In either case, you can save a lot of time by using the pipe operator.

The pipe (`|`, above the Enter key) lets you take Unix commands and chain them together. So here is how you could do it with piping:

```
grep "Ser" table.bed | grep "chr10" | grep "+" | wc -l
grep "Leu" table.bed | grep "chr9" | grep "+" | wc -l
```

One thing you'll notice is that there are many, many ways to do the same things. Once you're good enough at Unix, being able to do tasks in multiple ways is a mark of mastery! Here are some examples that you can already do.
* Copying a file: `cp file1 file2` and `cat file1 > file2`
* Word counting: `wc -l myfile` and `grep -c "" myfile`
