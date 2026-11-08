# V01 - Access a shell prompt and issue commands with correct syntax

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format (`[student@node1 ~]$`); the commands and their output are real and unedited.

## Exam objective (exact wording)
Access a shell prompt and issue commands with correct syntax

## What the video covers
1. Read the prompt: user, host, directory, `$` versus `#`.
2. Command, option, argument: `ls -l /etc/hostname`, short and long options (`-r` / `--kernel-release`).
3. Wrong syntax and the exit status (`echo $?`): 127 command not found, 2 invalid option or missing path, 1 missing operand, 0 success.
4. Spaces and quotes: `touch my file` makes two files, `touch "my file"` makes one.
5. Built-in help: `--help`, `man`.
6. Reboot step: nothing here needs a reboot, so the video says so and skips it. The practice task is checked after a reboot anyway.

## Sources
- The man pages on your own system are the reference you can use in the exam room: `man ls`, `man bash`, `man uname`. The video uses them.
- Red Hat EX200 exam page: check the current objective list before you book. Objectives change.

## Files
- `practice.md` - the task (and three broken attempts to fix)
- `solution.md` - the answer, kept separate
- `check.sh` - read-only checker
- `commands.md` - command reference

## Lab
Use the lab from V00. Run everything as `student`. Reset by deleting `~/lab1` and `~/syntax-demo`.
