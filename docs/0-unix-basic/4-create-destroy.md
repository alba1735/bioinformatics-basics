---
layout: default
title: Create and Delete Directories
parent: "Unix - Basic"
nav_order: 4
---
# Create and delete directories: `mkdir`, `rmdir`, `rm`

To create an empty directory use the `mkdir` command. The syntax is `mkdir {directory_name}`. Actually, you can create many empty directories, like `mkdir {directory1} {directory2} {directory3}` and so forth.

Create a directory named *first* (`mkdir first`).

* Confirm that you've made a new directory named *first* (`ls -l`).
* Now move into the directory (`cd first`). Confirm you're in this directory (`pwd`).
* Now make subdirectories named *second* and *third* (`mkdir second third`).
* Now type `ls -alt`. The `-t` option (also called flag, switch, argument, etc...) sorts the list by most recent. You should see something like:

```
[abagi@hummingbird first]$ ls -alt
total 5
drwxr-xr-x.  4 abagi ucsc_p_all_usr  4 Jan  9 14:37 .
drwxr-xr-x.  2 abagi ucsc_p_all_usr  2 Jan  9 14:37 third
drwxr-xr-x.  2 abagi ucsc_p_all_usr  2 Jan  9 14:37 second
drwx------. 14 abagi ucsc_p_all_usr 26 Jan  9 14:37 ..
```

The syntax for removing directories is `rmdir {directory_name}`. Remove the directory named *second* using `rmdir second`.
* Use `ls` to check your work.
