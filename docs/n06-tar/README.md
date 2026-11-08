# Archive, compress, unpack, and uncompress files using tar, gzip, and bzip2

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. The long package-install output is trimmed on screen, and the video says so.

## Exam objective (exact wording)
Archive, compress, unpack, and uncompress files using tar, gzip, and bzip2

## About the lab (not the objective)
- The `bzip2` program was not installed on the lab image, so `tar -cjf` and `bzip2` stopped with "command not found". The video installs it with `sudo dnf install -y bzip2`. Check on your own system with `which bzip2`.
- The file `/etc/services` is used only because it is large enough to show compression working.

## What the video covers
1. Anatomy of a tar command: `tar -czf archive.tar.gz what-to-put-inside`. `c` create, `z` gzip, `f` file name (last). Swap `c` for `t` to list or `x` to extract.
2. Create (`-cf`), list (`-tf`), extract (`-xf`, with `-C dir` to choose the destination).
3. Install bzip2, then compress with tar: `z` for gzip, `j` for bzip2. Compare the sizes.
4. gzip/gunzip and bzip2/bunzip2 on a single file.
5. Reboot step, then the practice task and checker.

## Honest limits
- Other options exist (`-v` for verbose, `-J` for xz, `--exclude`); the video keeps to the objective's three tools.
- Exact compressed sizes depend on the file and the tool version.

## Sources
- The man pages on your own system: `man tar`, `man gzip`, `man bzip2`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf project restore lab6 project.tar project.tar.gz project.tar.bz2 backup.tar.gz data.txt*`
