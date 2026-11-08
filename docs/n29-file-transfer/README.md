# Securely transfer files between systems

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** the lab has one machine, so `localhost` plays "the other system". The ssh connection, the commands and their output are the same as with a real server. Before the demo, the lab (not shown) creates an ssh key for `student` and trusts it, so that `localhost` accepts the connection without a password prompt. `scp` prints no progress bar here because the lab has no terminal.

## Exam objective (exact wording)
Securely transfer files between systems

## What the video covers
1. `scp`, `rsync` and `sftp` all use ssh underneath: encrypted, same login as ssh.
2. The pattern is tool, source, destination. A file on another system is `user@host:path`.
3. `scp report.txt student@localhost:/tmp/` sends a file; `scp student@localhost:/tmp/report.txt copy.txt` fetches it; `cmp` with no output means identical.
4. `scp -r project student@localhost:/tmp/` copies a folder (`-r` recursive). `ssh student@localhost ls /tmp/project` runs one command on the other system.
5. `rsync -av project/ student@localhost:/tmp/backup/`: `-a` archive (keeps folders, permissions, times), `-v` verbose. The trailing slash after `project` means "the contents of". A second run sends only what changed.
6. `sftp` is an interactive session (`get` downloads, `put` uploads). The video feeds it one command through a pipe: `echo 'ls /tmp/report.txt' | sftp -b - student@localhost`.

## Honest limits
- `scp` uses a capital `-P` for the port, `ssh` a lowercase `-p`.
- Not covered: ssh keys and `ssh-copy-id`, `scp -P`, `rsync --delete`, `rsync` over a non-default port, and ssh configuration.
- The checker looks at the result: `/tmp/exam-copy.txt` identical to `~/exam.txt`, and `/tmp/docs-backup` identical to `~/docs`.

## Sources
- The man pages on your own system: `man scp`, `man rsync`, `man sftp`, `man ssh`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Setup for the practice task is in `practice.md`.
