# Conditionally execute code (use of: if, test, [], etc.)

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The two script files are created for you by the lab script (typing them in vim, as in the vim video, gives the same files).

## Exam objective (exact wording)
Conditionally execute code (use of: if, test, [], etc.)

## What the video covers
1. The shell decides by exit status: 0 is success (true), anything else is failure. `$?` shows the status of the last command.
2. `test -f FILE` and `[ -d DIR ]` only check something and set the status. Spaces inside the brackets are required.
3. A first script (`check.sh`): `#!/bin/bash`, `if [ ... ]; then`, `else`, `fi`. Run with `./check.sh`; it fails with "Permission denied" until `chmod +x check.sh`.
4. Operators: files `-f -d -e`; numbers `-eq -ne -gt -lt -ge -le`; text `=` and `!=`.
5. A second script (`compare.sh`): a variable, `if` / `elif` / `else`, quoting `"$number"`, a text comparison with no `else`.
6. One-line decisions: `command1 && command2` (and), `command1 || command2` (or).
7. A script's own exit status: `./check.sh` then `echo $?`.
8. Reboot step (scripts are files on disk), then the practice task and checker.

## Honest limits
- Not covered: `case`, `[[ ]]`, `-z` and `-n` string tests, `!` negation, `-a`/`-o`, arithmetic with `(( ))`, `exit` codes you set yourself, reading input. Script arguments (`$1`) and loops are separate objectives and separate videos.
- The checker looks at the result (executable, first line `#!/bin/bash`, uses if with a test, prints `found`), so any correct script style passes.

## Sources
- The man pages on your own system: `man test`, `man bash` (section: Compound Commands), `man chmod`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab16 check.sh compare.sh`
