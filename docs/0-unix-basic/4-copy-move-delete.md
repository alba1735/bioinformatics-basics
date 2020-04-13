---
layout: default
title: Create, Move, and Delete
parent: "Unix - Basic"
nav_order: 4
---
# Copy, move, delete files: `cp`, `mv`, `rm`

Use `pwd` to make sure you're still in `/hb/home/{username}/first`. To copy files, type `cp {source_file} {destination_file}`. You can specify files in different paths. Do this by copying a file from user `abagi` home directory into your current directory. Type `cp /hb/home/abagi/bme110/unix_tutorial/copyme.txt myfile.`
* Use `ls` to make sure you were successful. You should only see `myfile` and `third` listed.

Now copy this file down to *third* using `cp myfile third`.
* What is the name of the file?
* Use `ls third` to check without changing directories.

The `mv` command can both rename files and move files. In fact, these are the same thing to the computer, so we can do both of them at the same time.
* The syntax to rename is `mv old_filename new_filename`.
* To move a file to a different directory, the syntax is `mv file new_directory`.
* To do both (rename and move), the syntax is `mv old_filename new_directory/new_filename.`

Type `mv myfile unix-tutorial.md` to rename `myfile` to `unix-tutorial.md`.
* Use `ls` to check your work.

Now type `cp third/myfile .` to copy `third/myfile` to the current directory.
* Use `ls` to check your work.

Now type `mv third fourth` to rename the directory.
* Again, use `ls` to check your work. You should have fourth and myfile listed.

To remove files, the syntax is `rm {filename}`. You can remove multiple files at once. Type `rm myfile` to get rid of it forever.
* **There is no Recycle Bin in Unix**, though some servers back up their data daily. This is not one of them, so be very careful with rm.
* Now, here's **a very, very dangerous command. USE WITH THE UTMOST CAUTION.** If the filesystem isn't set up properly, you can completely wreck servers with this command. Here it is: `rm -rf {directory}`.
  * Mostly you'd use this to recursively remove directories and all its files and subdirectories.
  * The `-r` flag specifies the recursive aspect - "continue using rm for all files in all subdirectories"
  * The `-f` flag specifies that yes, you really want to force the computer into doing something it doesn't want to do.

Try removing the fourth directory: `rm -rf fourth`. Again, be really careful with `rm -rf`.
* Google image search `rm -rf` for some spicy memes.
