# Create hard and soft links

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Create hard and soft links

## What the video covers
1. A file is a name plus data; the data is identified by an inode number.
2. `ln existing new` makes a hard link: a second name for the same data (same inode, link count goes up).
3. `ln -s target linkname` makes a soft (symbolic) link: a small file holding a path. `ls -li` shows its own inode, the type letter `l` and `->`. `readlink` prints where it points.
4. `echo text >> file` appends; both links show the change.
5. Delete the original: the hard link still has the data (link count drops), the soft link is broken.
6. Reboot step, then the practice task and checker.

## Honest limits
- Not covered: `ln -f`, `ln -r`, `ln -v`, `stat`, `find -inum`, linking across filesystems (hard links cannot), linking to directories (only soft links can).
- Relative soft-link targets are resolved from the folder that holds the link, not from where you ran `ln`.

## Sources
- The man pages on your own system: `man ln`, `man ls`, `man readlink`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf links`
