---
layout: default
title: SSH
parent: "Unix - Basic"
nav_order: 1
---
# SSH

**New this year: the Hummingbird cluster is now only accessible from official UCSC IP addresses.** To access externally, you will need to use the [campus VPN service](https://its.ucsc.edu/vpn/index.html){:target="blank"}.

The syntax for `ssh` (secure shell) is `ssh username@computer_name`. In this case, your username is your CruzID, and the computer name is `hb.ucsc.edu`.

```
  [abagi@islands ~]$ ssh abagi@hb.ucsc.edu
  The authenticity of host 'hb.ucsc.edu (128.114.47.21)' can't be established.
  ECDSA key fingerprint is SHA256:rnSx7GBmgLd1tPQjU4EVvLB1AMYBTo5bryRuWzLnxMU.
  Are you sure you want to continue connecting (yes/no)? yes
  abagi@hb.ucsc.edu's password:
```

The prompt for adding a fingerprint will only happen the first time you connect. This is a security / convenience utility - your computer will remember the connection in the future.

Type your password (should be CruzID Blue). It won't display any characters when you type for privacy. Once you've succesfully logged in, it should display this prompt:

```
 _                               _             _     _         _
| |                             (_)           | |   (_)       | |
| |__  _   _ _ __ ___  _ __ ___  _ _ __   __ _| |__  _ _ __ __| |
| '_ \| | | | '_ ` _ \| '_ ` _ \| | '_ \ / _` | '_ \| | '__/ _` |
| | | | |_| | | | | | | | | | | | | | | | (_| | |_) | | | | (_| |
|_| |_|\__,_|_| |_| |_|_| |_| |_|_|_| |_|\__, |_.__/|_|_|  \__,_|
                                          __/ |                  
                                         |___/                   

More information: www.hb.ucsc.edu
See "Start Here" for login, system detail, and accessing SOFTWARE.

Still need help?: hummingbird@ucsc.edu
------------------------------------------------------------------
Example Slurm scripts:  /hb/software/scripts

Disk quota per user:  1TB
Single jobs can use a maximum of 3 nodes.

Backups: look in /hb/home/.zfs/<date> for your account.

Please DON'T run compute jobs on the headnode. They will be killed.
-------------------------------------------------------------------
Students doing coursework - please use partition "Instruction"
Add "#SBATCH --partition=Instruction" to your SLURM Scripts.
-------------------------------------------------------------------
[abagi@hummingbird ~]$
```

Here's some of what you're seeing now:

- A **directory** is a folder. Your home directory is located at `/hb/home/{CruzID}`, where {CruzID} is your CruzID (duh). When you log in, it will automatically place you in this folder.
- Everything after the $ is where you type in commands.

When you log into the server, it will automatically start up a *shell* for you, a set of preferences and tools for you to navigate and use the server. There's a lot of different shells: bash, tcsh, etc. But most of them have the same core set of commands.
