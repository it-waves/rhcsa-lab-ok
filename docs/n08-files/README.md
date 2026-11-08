# Create, delete, copy, and move files and directories

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Create, delete, copy, and move files and directories

## What the video covers
1. `mkdir`, `mkdir -p` (create parents too), `ls -R` (list everything inside).
2. `touch` (empty file) and `echo text > file` (file with text).
3. `cp source destination`; a directory destination puts the copy inside it; `cp -r` for directories.
4. `mv source destination`: same folder renames, a directory destination moves inside; no original is left behind.
5. `rm` (no trash can), why `rm` refuses a directory, `rmdir` (empty directories only), `rm -r` (a directory and everything in it).
6. Reboot step, then the practice task and checker.

## Honest limits
- Options such as `-i` (ask before overwrite or delete), `-v` (verbose), `-f` (force) and wildcards are not covered; they are worth learning next.
- `rm -r` has no undo. Check the path before pressing Enter, and never run it as root on a path you have not checked.

## Sources
- The man pages on your own system: `man mkdir`, `man cp`, `man mv`, `man rm`, `man rmdir`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf projects backup lab8`
