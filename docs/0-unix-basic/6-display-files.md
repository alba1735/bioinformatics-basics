---
layout: default
title: Display Files
parent: "Unix - Basic"
nav_order: 6
---
# Display files: `cat`, `head`, `less`

To display an entire file, type `cat {filename}`.
* You can display multiple files pasted behind one another this way.
* Take a look at the file `/hb/home/abagi/bme110/unix_tutorial/catme.txt`.
* Follow the instructions there.

If all has gone well, a bunch of text should have just flown by the screen. So sometimes you'll want to use a different program, `less`.

Type `less unix-tutorial.md`. You can now scroll down and up, and hit the spacebar to scroll a page at a time. Press `q` to quit from this screen.

`less` is more, but more `more` than `more` is, so `more` is less `less`, so use more `less` if you want less `more`... If `less` is more than `more`, `most` is more than `less`. — Slackware Linux Essentials
{: .d-block .pl-6}

Sometimes you'll want to just see the top of a file. This is where `head` comes in. The syntax is `head [-n] {filename}`, where `n` is the number of lines to be displayed. By default, head will display 10. Try using `head -6 unix-tutorial.md`.
