# Use input-output redirection (>, >>, |, 2>, etc.)

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Use input-output redirection (>, >>, |, 2>, etc.)

## What the video covers
1. The three streams: 0 standard input, 1 standard output, 2 standard error.
2. `>` writes to a file and replaces it; `>>` appends.
3. `|` sends the output of one command to the input of the next.
4. `2>` redirects standard error; `> good.txt 2> bad.txt` splits the two streams.
5. `> file 2>&1` sends both streams to one file; `2> /dev/null` discards errors (the exit status is still 2).
6. `<` feeds a file to a command; `tee` writes to a file and shows the output.
7. Reboot step, then the practice task and checker.

## Sources
- The man pages on your own system: `man bash` (section REDIRECTION), `man tee`, `man ls`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf redir lab3` (from your home directory).
