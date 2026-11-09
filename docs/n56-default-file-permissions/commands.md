# Command reference

| Command | What it does |
|---|---|
| `umask` | show the umask (number) |
| `umask -S` | show the umask as letters (allowed permissions) |
| `umask 027` | set the umask for this shell only |
| `echo 'umask 027' >> ~/.bashrc` | make it permanent for this user |
| `touch FILE` / `mkdir DIR` | create a new file / directory |
| `ls -ld NAME` | list the permissions without opening a directory |
| `grep -n umask /etc/bashrc` | the system default line |
| `grep -n UMASK /etc/login.defs` | the UMASK setting for new users |

Quick table: umask 022 gives 644 / 755; umask 027 gives 640 / 750; umask 077 gives 600 / 700.
