---
layout: default
title: Navigation
parent: "Unix - Basic"
nav_order: 2
---
<!-- # Navigation Structure
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc} -->

# Navigating the UNIX filesystem: `pwd`, `cd`, `ls`

Each directory in the file system has a *path name* that uniquely specifies the location of the directory within the computer's file structure. Use the command `pwd` (print working directory) to display your current path `/` location.

```
[abagi@hummingbird ~]$ pwd
/hb/home/abagi
```

You should see your CruzID instead of `abagi`. This directory is your *home directory*. You have *permissions* to change anything inside this directory and its subdirectories as you wish. If you try to navigate to different directories outside of your home directory, you may not have read, write, or edit permissions.

The `cd` (change directory) command helps you navigate to different directories. The syntax is `cd {path}`. Change to the `/bin` directory like so:

```
[abagi@hummingbird ~]$ cd /bin
```

After executing the directory change, use `pwd` to confirm that you're in the `/bin` directory.

The `ls` (list) command lists the contents of a directory. The syntax for ls is: `ls [-al] {path}`, where the `[]` indicate optional values. If you type `ls` on its own, it will list the contents of your current directory. Now type `ls`.

You will see a list of files and directories in `/bin`. `/bin` (short for binaries) is a holdover from older times, but it basically is a repository for independently executable programs and scripts on this server. You can run any program from `/bin` anywhere on the server.

As you can see, there is a lot of junk that you can run. You'll learn a few of the important ones in this tutorial.

Type `cd`. If you don't specify a directory or path, it will return you to your home directory no matter where you are. Now that you're in your home directory, type `ls` again. You should see a listing of all the files in your home directory:

```
[abagi@hummingbird ~]$ ls
bin  bio  include  lib  share
```
**By the way** - the examples here are going to be my personal customized prompt. Yours will look different.

Right now, you may or may not have files or directories in your home directory. If there's nothing, ls will return nothing. If you have a good ssh client, your directories will be colored in blue while your plain files will be colored in white.

Now type `ls /`. `/` is the root directory for the entire filesystem. Every directory is a subdirectory of the root folder `/`.

Now type `ls -a`. The `-a` option stands for "all".

```
[abagi@hummingbird ~]$ ls -a
.              .bash_logout   bin     .config  .history  .lesshst  .ncbirc   .ssh       .zshrc
..             .bash_profile  bio     .emacs   include   lib       .profile  .t_coffee
.bash_history  .bashrc        .cache  .gnome2  .kshrc    .mozilla  share     .viminfo
```

What's happening here?

* Unix hides all files that start with a `.` by default. These are hidden files that you typically don't need to interact with. Often, preferences will be saved in hidden files or folders.
* I probably have a lot more hidden files than you do since I've used this server before.
* `.` is your current directory. You can test this by typing `cd .` (change to the directory that is... your current directory `.` Type `pwd` to confirm this) or by typing `ls .`.
* `..` is the *parent* directory. **Don't** try it now, because the parent directory will list all user directories - basically all students, staff, and faculty at UCSC. This will take a long time!
  * Instead, switch to a subdirectory (e.g., `cd bio`), then list the files in your home directory with `ls ..` to confirm that `..` links to the parent directory. If you don't have a subdirectory, continue on...
  * Since each directory has `..`, you can chain these together (not that it's particularly useful), like for example, `cd bio/../bio/../bio`.

Now type `ls -al`. `-l` (long) will display lots of extra information about the files and folders. Here's an excerpt from mine.

```
[abagi@hummingbird ~]$ ls -al
total 55
drwx------.  13 abagi ucsc_p_all_usr   25 Jan  9 14:26 .
drwxr-xr-x. 484 root  root            484 Jan  3 21:37 ..
-rw-------.   1 abagi ucsc_p_all_usr 8947 Jan  9 14:22 .bash_history
-rw-r--r--.   1 abagi ucsc_p_all_usr   18 Mar  4  2016 .bash_logout
-rw-r--r--.   1 abagi ucsc_p_all_usr  176 Mar  4  2016 .bash_profile
-rw-r--r--.   1 abagi ucsc_p_all_usr  124 Mar  4  2016 .bashrc
drwxr-xr-x.   2 abagi ucsc_p_all_usr   20 Mar 29  2017 bin
drwxr-xr-x.   4 abagi ucsc_p_all_usr    4 Sep 28  2016 bio
drwxr-xr-x.   3 abagi ucsc_p_all_usr    3 Jan  9 14:19 .cache
drwxr-xr-x.   3 abagi ucsc_p_all_usr    3 Jan  9 14:19 .config
-rw-r--r--.   1 abagi ucsc_p_all_usr  500 Mar  4  2016 .emacs
drwxr-xr-x.   2 abagi ucsc_p_all_usr    2 Mar  4  2016 .gnome2
-rw-------.   1 abagi ucsc_p_all_usr    0 Mar 28  2017 .history
```

What's happening here?

* Files are sorted lexicographically.
* The first column explains the permissions. More on that below.
* Don't worry about the second column.
* Column 3 shows who owns the directory or file. Yes, even in computer systems there are ownership rights and a central authority that enforces these rules.
* Column 4 shows which user group the directory or file is under.
* Column 5 is... I don't really know honestly.
* Column 6 and 7 show the date and time the file was modified.

# Permissions

The first column above shows file permissions and file types. Here's a toy example.

```
-rwxr-xr-x
```

* The very first dash indicates file type. 'd' means directory. 'l' means a link. '-' typically means a regular file.
* The next three letters `rwx` mean that the owner (user in the third column) has read, write, and execute permissions.
* The next three letters `r-x` means that the group (fourth column) does not have write permissions, but can read and execute the file.
* The last group of three letters gives the permissions for everyone else. In this case, anyone can read and execute the file.
* Here's another example: `-rwxr--r--` means this ordinary file can be read, edited, and executed by the owner, and only read by everyone else.
