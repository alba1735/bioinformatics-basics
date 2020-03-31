---
layout: default
title:  "UNIX Basics"
nav_order: 0
has_children: true
---
# UNIX Basics

Introduction and basics to using UNIX from terminal installation to file manipulation.
{: .fs-6 .fw-300 }

# Tips and tricks

* Ctrl+C in a terminal does not copy. Instead, it sends a terminate signal to the server to stop and drop whatever it's doing. (Ctrl+\ sort of does this too)
* Hit Tab to use autocomplete. The system will search for files in the current path to autocomplete to. Hit it twice to get a quick listing of whatever files start with the text you've typed.
* Most Unix utilities have a manual page. Access it using `man {program}`. It'll use `less` to open up the proper manpage. Warning, these are full of arcane terminology.
* Most (well-written) programs either have a manpage or a help option, accessible by typing `{program} -h` or `{program} --help`. This varies and not everyone conforms to one standard.
* When on the command line prompt, press the up arrow key to scroll through your past history. Alternatively, type `!!` and hit Enter to automatically run the last command again.
* The tilde (`~`) (usually left of the 1 key) character refers to your home directory in most shells. So you could type `cd ~` to move to your home directory from anywhere.
