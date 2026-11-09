# Create, delete, and modify local user accounts

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**The demo changes nothing silently.** It creates the users `alice`, `bob` and `carol`, changes `alice`, and deletes `bob` and `carol`. **One step is silent in the practice lab only:** before the practice check the lab runs `sudo useradd temp`, so you have a user to delete. This is said in the video.

## Exam objective (exact wording)
Create, delete, and modify local user accounts

## What the video covers
1. A local user is one line in `/etc/passwd`, shown with `getent passwd NAME`: name, password placeholder `x`, user ID, group ID, comment, home directory, shell.
2. `sudo useradd NAME` creates a user (and its home directory); `id NAME`, `getent passwd NAME`, `ls -d /home/NAME` show the result.
3. Options: `-u` user ID, `-c` comment, `-s` login shell.
4. `sudo usermod -s /usr/sbin/nologin NAME` and `sudo usermod -c "Full Name" NAME` change an existing user.
5. `sudo userdel NAME` removes the user but keeps the home directory; `sudo userdel -r NAME` removes the home too.
6. After a reboot the changes remain.

## Honest limits
- Not covered (other objectives or beyond this one): passwords and aging (the next video), groups and `-g`/`-G`, `usermod -L`/`-U`, `-d`/`-m`, `-e`, `userdel -f`, `/etc/shadow`, `/etc/login.defs` and `/etc/skel`.
- The user ID `1001` for `alice` is what this fresh image assigned; on your system the first new user may get a different number.
- The demo leaves `alice` (nologin) and `/home/bob` in place.

## Sources
- The man pages on your own system: `man useradd`, `man usermod`, `man userdel`, `man 5 passwd`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare the practice: `sudo useradd temp`.
