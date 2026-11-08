# List, set, and change standard ugo/rwx permissions

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
List, set, and change standard ugo/rwx permissions

## What the video covers
1. `ls -l`: the first column holds the type character plus three groups of three (user, group, others). The trailing dot is an SELinux marker (a later topic).
2. r = 4, w = 2, x = 1; add them per group (`rw-` = 6, `r--` = 4, so `-rw-r--r--` is 644).
3. `chmod` with letters: who (`u`, `g`, `o`), `+` or `-`, then what (`r`, `w`, `x`).
4. `chmod` with numbers: `640`, `755`.
5. What a bit does: removing `r` from the owner makes `cat` fail with Permission denied.
6. Directories: `x` means you may enter it; `ls -ld` shows the directory itself.
7. Reboot step, then the practice task and checker.

## Honest limits
- Not covered: `chown`/`chgrp`, `umask`, special bits (setuid, setgid, sticky), ACLs, `a` (all) in `chmod`, and `chmod -R`.
- Root is not stopped by these bits; the demo uses a normal user.

## Sources
- The man pages on your own system: `man chmod`, `man ls`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf perms lab10`
