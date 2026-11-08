# Use grep and regular expressions to analyze text

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Use grep and regular expressions to analyze text

## Lab preparation (run once, not part of the objective)
The video searches a small log file. Create it in your home directory by running these commands one at a time:

```
echo '2026-11-07 09:01 INFO web started' > server.log
echo '2026-11-07 09:02 INFO db connected' >> server.log
echo '2026-11-07 09:05 WARNING disk at 85 percent' >> server.log
echo '2026-11-07 09:07 ERROR login failed for user alice' >> server.log
echo '2026-11-07 09:08 INFO backup finished' >> server.log
echo '2026-11-07 09:09 ERROR login failed for user bob' >> server.log
echo '2026-11-07 09:12 error timeout talking to db' >> server.log
echo '2026-11-07 09:15 INFO web stopped' >> server.log
cat server.log
```

The first line uses `>` (it starts the file); the others use `>>` (they add to it), as in the previous video.

## What the video covers
1. `grep ERROR server.log`: print the lines that contain a word. Capital letters matter; `-i` ignores case.
2. Options: `-v` invert, `-c` count, `-n` line numbers.
3. Regular expressions (put the pattern in single quotes): `^` start of line, `$` end of line, `.` any one character, `*` repeat the previous thing, `[ab]` one character from a set.
4. Extended expressions with `-E`: `|` means or, `+` means one or more.
5. `grep -r` searches every file in a folder (protected files need `sudo`); grep also reads a pipe.
6. Reboot step, then the practice task and checker.

## Honest limits
- As a normal user, `grep -r PermitRootLogin /etc/ssh` prints "Permission denied" for protected files; the video shows this and then uses `sudo`. On this lab the setting is only a commented-out line.

## Sources
- The man pages on your own system: `man grep`, and `man 7 regex` if it is installed.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab4 server.log` (from your home directory).
