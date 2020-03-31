---
layout: default
title: Terminal Install
parent: "Unix - Basic"
nav_order: 0
---
# Accessing a Unix-like server

Unix is an operating system. Pretty much all servers (as opposed to personal computers) run a variant of Unix. Anyone with a UCSC account can access the computing server Hummingbird. [See more details here](https://www.hb.ucsc.edu/).

You can remotely access and login to the server to run programs. To do this, we typically use a program called `ssh`. You'll need to install this program on your computer first.

## Mac/Linux

Mac OS X is itself a variant of Unix. Open the Terminal application and you're good to go.

## Windows

**If you are using Windows 10 I highly, highly recommend you use Windows Subsystem Linux (WSL)**. It is fairly straightforward to install, avoids some dependencies issues, and is supported by Microsoft. If you choose this method follow the instructions from the link below. I would recommend choosing **Ubuntu 18.04 LTS** for your distro of choice. [See more details here](https://docs.microsoft.com/en-us/windows/wsl/install-win10).

If you are not using Windows 10 I would recommend Git Bash. It's currently one of the best ways to use Unix-like tools (such as `ssh`) on Windows. [Download](https://gitforwindows.org/). You don't have to install Git - just make sure you install Git Bash.

Some other options:

- Browser app. Go to the Chrome App Store or Firefox App Store (whatever they're called). There are apps available for you to `ssh` into servers. These can be a little clunky, but are a great option.
- PuTTy. It's the classic way to `ssh` and has been around since before computers were invented. [Download](https://www.putty.org/)
- Cygwin
- Windows PowerShell.
- Other options?

## Chromebook / Other

No personal experience, but it appears you can install a version of Ubuntu using Crouton - [see this page](https://ubuntu.com/tutorials/install-ubuntu-on-chromebook#1-overview) for instructions (or Google, for multiple tutorials)

## Android / iOS

If you have a iPad or Android tablet you are able to run a terminal to connect to a remote machine like hummingbird. **While it is highly advised to use a machine like Windows, Mac OS or Linux it is still possible to use these machines.** I recommend the following apps.

[Android](https://play.google.com/store/apps/details?id=com.sonelli.juicessh&hl=en_US)

[iOS](https://apps.apple.com/us/app/termius-ssh-client/id549039908)

There is one caveat with using these devices. **You will need to `ssh` into a remote machine like hummingbird to do anything.** If you have no internet access or the server is not working you will be unable to do anything.
