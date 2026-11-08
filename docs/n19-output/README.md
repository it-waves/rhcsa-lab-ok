# Processing output of shell commands within a script

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The script files are created for you by the lab script (typing them in vim gives the same files).

## Exam objective (exact wording)
Processing output of shell commands within a script

## What the video covers
1. Command substitution: `$(command)` is replaced by what the command printed.
2. Save it in a variable: `host=$(hostname -s)`, then use `$host`.
3. A pipe: `ls data | wc -l` counts the files (`wc -l` counts lines).
4. Use output in a test: `[ "$(id -u)" -eq 0 ]` (`-eq` = equals, for numbers).
5. Loop over output: `for f in $(ls data); do ... done`.
6. Reboot step (scripts are files on disk), then the practice task and checker.

## Honest limits
- Not covered: backticks (the old form of `$( )`), `while read` over command output, `xargs`, `awk` and `sed` processing, capturing error output (`2>&1`), `$?` after a substitution.
- `for f in $(ls ...)` splits on spaces, so it is wrong for file names that contain spaces; the video says so, and a later method is needed for that case.
- The checker looks at the result (executable, first line `#!/bin/bash`, uses `$( )` or backticks, and the two output lines match this machine's host name and `/etc/passwd` line count).

## Sources
- The man pages on your own system: `man bash` (section: Command Substitution), `man hostname`, `man wc`, `man id`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab19 data host.sh count.sh whoami.sh each.sh`
