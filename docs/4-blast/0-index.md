---
layout: default
title:  "Blast"
nav_order: 4
has_children: false
nav_exclude: false
---
# BLAST

Introduction to using blast online and in the terminal.
{: .fs-6 .fw-300 }

## Using BLAST Online

Given the following mystery sequence

```
MVRLKSRYILFEIIFPPTDTNVEESVSKADILLSHHRASPADVSIKSILQEIRRSLSLNLGDYGSAKCNSLLQLKYFSNKTSTGIIRCHREDCDLVIMALMLMSKIGDVDGLIVNPVKVSGTIKKIEQFAMRRNSKILNIIKCSQSSHLSDNDFIINDFKKIGRENENENEDD
```

Use BLAST to learn more about it. Answer the following questions and check your answers below.

- What BLAST program should you use?
- What species is it from?
- What is the identity of this protein?
- What is its biological function?
- Which domains contain homologs?
- Once you think you've figured these out, the answers are below (highlight to see white text).

- blastp
- Saccharomyces cerevisiae
- POP5
- RNase P subunit
- Eukaryotes only

## Command line BLAST

As with most computational biology tools, BLAST first originated on the command line. Then, NCBI set up some servers to run it, converted all their sequences into a database, and created a GUI wrapper so you can click on options.

Here's an example. Let's use command line blast this following mystery sequence to find out where it's from.

```
>mystery_seq
CAGTGATCTTTATGGGCCTTGGAAGAGGAAGTTCCTGGCAGACTTGGGGGTCATTAATCAATGTATTGCC
CCTCCGAATATGAGGAAAGTCAATGATCAATATTTAACAAATGTGGCTTTGAAAATAAATGCGAAGGTTG
GTGGCCTCAACTCTGTTTTATCTGTGGAATTTGCGCATAAGATACCTAAGATATCCACGAAACCAACAAT
TATTATTGGGATGGATGTTTCACACGGTTCTCCAGGACATGCAGATTCACCTTCAATTTCAGCGGTCGTC
TCATCGAGAGAATGGCCCTTGATTTCAAGATATAGAGCTTCAGTGAGAACTCAATCACCCAAGGTTGAGA
TGATTGAAGCTTTGTACAAACCGTTGCCCTCAGGAAAGGATGCGGGCATGATCAGTGAGCTACTTGTGGA
CTTCTACCAATCATGCAATCCGCCACCTAATGTAGAAAGAAAACCGCAGCAAATGATTGTCTTCAGAGAT
GGAGTCAGTGAATCACAATTTGACCAGGTCCTGAATGTTGAGTTACAAGCTATATATAAGGCATGCAATC
ACATAGAGGCTGGTTATAAGCCTAAAGTCACACTGATTATTGCACAGAAGAATCATCACACAAAGCTATT
CCCTAGTGGTGGTCCAGGCAATGTGCAGCCAGGGACTATTGTAGATGCCCAGATTTGTCATCCTAGAAAT
TTTGATTTTTACTTGTGTCCTCAGGCCGGCCCAATAGGAACATCACGGCCTACTCATTATCATGTCTTAC
TGGATGAGAATGATTTTAGTGTGGATGATCTTCAGATTCTTGTCCACGCTCTATCTTATGTGTATCAAAG
AAGTACGACCGCAATCTCTTCAGTTGCACCAATAAACTATGCGCATCTAGCTGCGAGCCAGATGCAACAA
TTCCTCAAGGCAGAGGATCTTTCAGAAACAGCTTCGCGATCTGGAAAAGGGGAAGGGTCAGTTGCATCTG
GAGGAGGAGGATACACTGCCCCTGTACCTGAACTCCCTGTGCTGCACCGAAATGTTTGCAACACCATGTT
TTTCTGCTGA
```

We'll use blastn to find nucleotide sequences that match this.

```
[blin@zam ~/.html/pub/bme110-w18]$ blastn -query mystery_argonaute.fa -db /projects/lowelab/db/nt/nt
BLASTN 2.3.0+


Reference: Zheng Zhang, Scott Schwartz, Lukas Wagner, and Webb
Miller (2000), "A greedy algorithm for aligning DNA sequences", J
Comput Biol 2000; 7(1-2):203-14.



Database: All GenBank+EMBL+DDBJ+PDB sequences (but no EST, STS,
GSS,environmental samples or phase 0, 1 or 2 HTGS sequences)
           10,077,905 sequences; 29,096,408,678 total letters



Query= mystery_argonaute

Length=1060
                                                                      Score     E
Sequences producing significant alignments:                          (Bits)  Value

gb|DQ068741.1|  Picea glauca argonaute/Zwille-like protein mRNA, ...  1958    0.0  


>gb|DQ068741.1| Picea glauca argonaute/Zwille-like protein mRNA, complete cds
Length=2880

 Score = 1958 bits (1060),  Expect = 0.0
 Identities = 1060/1060 (100%), Gaps = 0/1060 (0%)
 Strand=Plus/Plus

Query  1     CAGTGATCTTTATGGGCCTTGGAAGAGGAAGTTCCTGGCAGACTTGGGGGTCATTAATCA  60
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  1821  CAGTGATCTTTATGGGCCTTGGAAGAGGAAGTTCCTGGCAGACTTGGGGGTCATTAATCA  1880

Query  61    ATGTATTGCCCCTCCGAATATGAGGAAAGTCAATGATCAATATTTAACAAATGTGGCTTT  120
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  1881  ATGTATTGCCCCTCCGAATATGAGGAAAGTCAATGATCAATATTTAACAAATGTGGCTTT  1940

Query  121   GAAAATAAATGCGAAGGTTGGTGGCCTCAACTCTGTTTTATCTGTGGAATTTGCGCATAA  180
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  1941  GAAAATAAATGCGAAGGTTGGTGGCCTCAACTCTGTTTTATCTGTGGAATTTGCGCATAA  2000

Query  181   GATACCTAAGATATCCACGAAACCAACAATTATTATTGGGATGGATGTTTCACACGGTTC  240
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2001  GATACCTAAGATATCCACGAAACCAACAATTATTATTGGGATGGATGTTTCACACGGTTC  2060

Query  241   TCCAGGACATGCAGATTCACCTTCAATTTCAGCGGTCGTCTCATCGAGAGAATGGCCCTT  300
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2061  TCCAGGACATGCAGATTCACCTTCAATTTCAGCGGTCGTCTCATCGAGAGAATGGCCCTT  2120

Query  301   GATTTCAAGATATAGAGCTTCAGTGAGAACTCAATCACCCAAGGTTGAGATGATTGAAGC  360
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2121  GATTTCAAGATATAGAGCTTCAGTGAGAACTCAATCACCCAAGGTTGAGATGATTGAAGC  2180

Query  361   TTTGTACAAACCGTTGCCCTCAGGAAAGGATGCGGGCATGATCAGTGAGCTACTTGTGGA  420
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2181  TTTGTACAAACCGTTGCCCTCAGGAAAGGATGCGGGCATGATCAGTGAGCTACTTGTGGA  2240

Query  421   CTTCTACCAATCATGCAATCCGCCACCTAATGTAGAAAGAAAACCGCAGCAAATGATTGT  480
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2241  CTTCTACCAATCATGCAATCCGCCACCTAATGTAGAAAGAAAACCGCAGCAAATGATTGT  2300

Query  481   CTTCAGAGATGGAGTCAGTGAATCACAATTTGACCAGGTCCTGAATGTTGAGTTACAAGC  540
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2301  CTTCAGAGATGGAGTCAGTGAATCACAATTTGACCAGGTCCTGAATGTTGAGTTACAAGC  2360

Query  541   TATATATAAGGCATGCAATCACATAGAGGCTGGTTATAAGCCTAAAGTCACACTGATTAT  600
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2361  TATATATAAGGCATGCAATCACATAGAGGCTGGTTATAAGCCTAAAGTCACACTGATTAT  2420

Query  601   TGCACAGAAGAATCATCACACAAAGCTATTCCCTAGTGGTGGTCCAGGCAATGTGCAGCC  660
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2421  TGCACAGAAGAATCATCACACAAAGCTATTCCCTAGTGGTGGTCCAGGCAATGTGCAGCC  2480

Query  661   AGGGACTATTGTAGATGCCCAGATTTGTCATCCTAGAAATTTTGATTTTTACTTGTGTCC  720
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2481  AGGGACTATTGTAGATGCCCAGATTTGTCATCCTAGAAATTTTGATTTTTACTTGTGTCC  2540

Query  721   TCAGGCCGGCCCAATAGGAACATCACGGCCTACTCATTATCATGTCTTACTGGATGAGAA  780
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2541  TCAGGCCGGCCCAATAGGAACATCACGGCCTACTCATTATCATGTCTTACTGGATGAGAA  2600

Query  781   TGATTTTAGTGTGGATGATCTTCAGATTCTTGTCCACGCTCTATCTTATGTGTATCAAAG  840
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2601  TGATTTTAGTGTGGATGATCTTCAGATTCTTGTCCACGCTCTATCTTATGTGTATCAAAG  2660

Query  841   AAGTACGACCGCAATCTCTTCAGTTGCACCAATAAACTATGCGCATCTAGCTGCGAGCCA  900
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2661  AAGTACGACCGCAATCTCTTCAGTTGCACCAATAAACTATGCGCATCTAGCTGCGAGCCA  2720

Query  901   GATGCAACAATTCCTCAAGGCAGAGGATCTTTCAGAAACAGCTTCGCGATCTGGAAAAGG  960
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2721  GATGCAACAATTCCTCAAGGCAGAGGATCTTTCAGAAACAGCTTCGCGATCTGGAAAAGG  2780

Query  961   GGAAGGGTCAGTTGCATCTGGAGGAGGAGGATACACTGCCCCTGTACCTGAACTCCCTGT  1020
             ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
Sbjct  2781  GGAAGGGTCAGTTGCATCTGGAGGAGGAGGATACACTGCCCCTGTACCTGAACTCCCTGT  2840

Query  1021  GCTGCACCGAAATGTTTGCAACACCATGTTTTTCTGCTGA  1060
             ||||||||||||||||||||||||||||||||||||||||
Sbjct  2841  GCTGCACCGAAATGTTTGCAACACCATGTTTTTCTGCTGA  2880



Lambda      K        H
    1.33    0.621     1.12

Gapped
Lambda      K        H
    1.28    0.460    0.850

Effective search space used: 29540461433951


  Database: All GenBank+EMBL+DDBJ+PDB sequences (but no EST, STS,
GSS,environmental samples or phase 0, 1 or 2 HTGS sequences)
    Posted date:  Oct 3, 2009  5:42 PM
  Number of letters in database: 29,096,408,678
  Number of sequences in database:  10,077,905



Matrix: blastn matrix 1 -2
Gap Penalties: Existence: 0, Extension: 2.5
```

Notice that the information given to you on the command line is the exact same that the online tool gives you! In fact, in the web GUI, under Formatting options, you can opt to display alignments in the same way.
