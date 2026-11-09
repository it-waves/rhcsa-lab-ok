# Diagnose and correct file permission problems

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Important lab note:** before the demo, the lab (not shown) creates `deploy.sh` in the home folder with mode 644, creates `/srv/proj/reports/q3.txt` owned by root, sets the folder `reports` to mode 700 and the file to mode 600. These steps change the system.

## Exam objective (exact wording)
Diagnose and correct file permission problems

## What the video covers
1. The method: who am I, who owns the file and which permissions, can I reach it (every folder on the path needs `x`).
2. `./deploy.sh` says `Permission denied`; `ls -l deploy.sh` shows `-rw-r--r--` (no execute bit); `chmod u+x deploy.sh` fixes it.
3. `cat /srv/proj/reports/q3.txt` is denied; `namei -l /srv/proj/reports/q3.txt` shows the folder `reports` is `drwx------ root root`.
4. `sudo chmod 755 /srv/proj/reports` fixes the folder, but the file is still denied: `ls -l` shows owner `root`, mode 600.
5. `sudo chown student /srv/proj/reports/q3.txt` fixes the owner; one fix at a time, checking after each.
6. After a reboot the permissions are unchanged.

## Honest limits
- Not covered: ACLs (`getfacl`, `setfacl`), set-GID folders, SELinux contexts (the dot after the permissions), `chgrp`, `umask`, sticky bit, and the `sudo` rules themselves.
- The checker runs `run.sh` (it only prints a line), reads `plan.txt` and fails the task if the folder is writable by others.

## Sources
- The man pages on your own system: `man chmod`, `man chown`, `man namei`, `man ls`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
