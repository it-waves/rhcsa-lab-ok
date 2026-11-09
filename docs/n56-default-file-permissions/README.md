# Manage default file permissions

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. In the lab every command runs in its own new shell, which is why the umask is made permanent in `~/.bashrc` before the new files are created.

**The demo changes the lab user's `~/.bashrc`** (it appends `umask 027`); it creates `file1`, `dir1`, `file2`, `dir2`, `file3` in the home folder. To undo: delete the last line of `~/.bashrc`. **One step is silent in the practice lab only:** before the practice check the lab creates the user `ivan` (`sudo useradd ivan`). This is said in the video.

## Exam objective (exact wording)
Manage default file permissions

## What the video covers
1. A new file starts from 666, a new directory from 777; the umask removes bits. Umask 027: file 640, directory 750; umask 022: file 644, directory 755.
2. `umask` (number) and `umask -S` (letters) show the current umask.
3. `touch`, `mkdir` and `ls -ld` show the result. The dot after the permissions is the SELinux marker.
4. `umask 027` in a shell lasts only for that shell. To make it permanent for one user, add the line `umask 027` to that user's `~/.bashrc`.
5. System defaults: `/etc/bashrc` (sets 022 when the umask is 0) and `UMASK` in `/etc/login.defs`.
6. After a reboot the umask from `.bashrc` is still active.

## Honest limits
- Not covered: `/etc/profile` and `/etc/profile.d`, `pam_umask`, ACL default permissions (`setfacl -d`), setgid directories, and the difference between login and non-login shells in detail.
- The umask subtracts bits (it is a mask); with an odd digit, subtraction and masking can differ, so think in bits.

## Sources
- The man pages on your own system: `man bash` (section on `umask`), `man umask`, `man login.defs`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare the practice: `sudo useradd ivan`.
