---
layout: default
title:  "Emboss Suite"
parent: "Unix - Intermediate II"
nav_order: 0
---
# EMBOSS Suite

Copy over the file `/hb/home/bylin/bme110/emboss_problems/saccCere_cds.fa` to your bme110 directory.

Also, copy over the Pyrobaculum aerophilum genome to your directory

`/hb/home/tmjlowe/bme110/Paero-genome.fa`

You can repeat the geecee and other nucleotide analysis commands on the entire genome, not just the protein coding regions you did above.  Extra challenge, if you are curious, grab the full set of P. aerophilum tRNAs using the Table Browser for that species.  Is the G/C content higher for (a) the full genome, (b) the coding regions, or (c) the tRNAs (use the union command to combine all the tRNAs in one sequence).

## EMBOSS quick reference

Here are some programs that you'll find useful.

* `wordcount`: Count unique words in sequences. A word means a sequence of letters. For example, if you have a sequence `AAAAG`, then there are 2 instances of `AAA` and 1 instance of `AAG`. Requires a word size parameter.
* `transeq`: TRANSlate your genes sequences into proteins. Most of the defaults are okay for this one, but if you want to, you can adjust for things like different genetic codes or reading frame.
* `geecee`: Get GC content of nucleic acid sequences in FASTA format. This will work with DNA or RNA, but not protein (obviously)
* `shuffleseq`: Shuffle each individual sequence. This means that (a) the shuffled sequence maintains the original sequence's base or amino acid composition, and (b) the length of the sequence stays the same.
* `pepstats`: Get protein statistics for individual protein sequences. This includes things like number of residues, isoelectric point, amino acid composition, et cetera.
* `cusp`: Calculate a codon usage table. Only takes nucleotide sequences.
* `union`: Combine all sequences within a FASTA file into one sequence. **The one sequence will have the same name as the first sequence.** This can be confusing!
* `getorf`: Finds and extracts open reading frames. There are a lot of options here for you to tune. Using a sliding window, it scans through the sequence looking for start codons, then outputs the ORFs that may result from those start codons. A very typical assignment in undergraduate bioinformatics programming classes.

## Piping and EMBOSS

In general, when you run an EMBOSS program on Hummingbird, it may prompt you for input and output files. Here's an example.

```
[bylin@hummingbird emboss_problems]$ geecee
Calculate fractional GC content of nucleic acid sequences
Input nucleotide sequence(s):
```

You then have to type in the input filename. Next, it will ask you for an output filename.

```
[bylin@hummingbird emboss_problems]$ geecee
Calculate fractional GC content of nucleic acid sequences
Input nucleotide sequence(s): saccCere_cds.fa
Output file [saccer3_sgdgene_yal012w.geecee]:
```

The name in brackets is the default filename for your output. If you hit Enter at this point without specifying an output file, EMBOSS will write the results in `saccer3_sgdgene_yal012w.geecee`.

However, when you specify the input and output files, it doesn't prompt you.

```
[bylin@hummingbird emboss_problems]$ geecee -sequence saccCere_cds.fa -outfile output.geecee
Calculate fractional GC content of nucleic acid sequences
```

What if you want to pipe things in and out of EMBOSS programs? Use the `-filter` option. Here's an example with `wordcount`: I want to look at the flanking nucleotides around `GAGAGA` sequences, and see if they're enriched for any particular bases.

```
[bylin@hummingbird emboss_problems]$ wordcount -filter -wordsize 7 saccCere_cds.fa | grep "GAGAGA"
GAGAGAA 100
TGAGAGA 86
GAGAGAT 75
AGAGAGA 74
GGAGAGA 56
GAGAGAG 41
GAGAGAC 38
CGAGAGA 38
```

Not only does it print the output to standard output, you also don't have the annoying line that describes the program! Looks like Cs are the least common on both 5' and 3' ends (bottom 4), though it's not clear whether it's specifically enriched or just random variation.

Here, I specify in `wordcount` that I want a word size of 7. After counting all the word sizes, the output is directed to **stdout** and not a file! Then, the pipe `|` captures the **stdout** output and inputs it into `grep`.

Or, suppose I wanted to get overall peptide stats for the entire file:

```
[bylin@hummingbird emboss_problems]$ union -filter saccCere_cds.fa | transeq -filter | pepstats -filter
PEPSTATS of sacCer3_sgdGene_YAL012W_1 from 1 to 276654

Molecular weight = 31180687.00      Residues = 276654
Average Residue Weight  = 112.706   Charge   = 2115.5
Isoelectric Point = 7.1821
A280 Molar Extinction Coefficients  = 28919720 (reduced)   29150345 (cystine bridges)
A280 Extinction Coefficients 1mg/ml = 0.927 (reduced)   0.935 (cystine bridges)
Improbability of expression in inclusion bodies = 0.754

Residue     Number      Mole%       DayhoffStat
A = Ala     15709       5.678       0.660   
B = Asx     0       0.000       0.000   
C = Cys     3690        1.334       0.460   
D = Asp     15616       5.645       1.026   
E = Glu     16953       6.128       1.021   
F = Phe     12465       4.506       1.252   
G = Gly     13883       5.018       0.597   
H = His     5953        2.152       1.076   
I = Ile     18650       6.741       1.498   
J = ---     0       0.000       0.000   
K = Lys     19558       7.069       1.071   
L = Leu     26078       9.426       1.274   
M = Met     5788        2.092       1.231   
N = Asn     16966       6.133       1.426   
O = ---     0       0.000       0.000   
P = Pro     12082       4.367       0.840   
Q = Gln     10241       3.702       0.949   
R = Arg     12150       4.392       0.896   
S = Ser     25383       9.175       1.311   
T = Thr     16952       6.128       1.005   
U = ---     0       0.000       0.000   
V = Val     15633       5.651       0.856   
W = Trp     2704        0.977       0.752   
X = Xaa     772     0.279       279.049
Y = Tyr     9428        3.408       1.002   
Z = Glx     0       0.000       0.000   

Property    Residues        Number      Mole%
Tiny        (A+C+G+S+T)     75617       27.333
Small       (A+B+C+D+G+N+P+S+T+V)   135914      49.128
Aliphatic   (A+I+L+V)       76070       27.496
Aromatic    (F+H+W+Y)       30550       11.043
Non-polar   (A+C+F+G+I+L+M+P+V+W+Y) 136110      49.199
Polar       (D+E+H+K+N+Q+R+S+T+Z)   139772      50.522
Charged     (B+D+E+H+K+R+Z)     70230       25.385
Basic       (H+K+R)         37661       13.613
Acidic      (B+D+E+Z)       32569       11.772
```

**You are highly recommended to use the `-filter` option as much as possible.**
