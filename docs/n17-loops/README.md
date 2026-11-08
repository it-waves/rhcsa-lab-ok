# Use Looping constructs (for, etc.) to process file, command line input

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The script files are created for you by the lab script (typing them in vim gives the same files).

## Exam objective (exact wording)
Use Looping constructs (for, etc.) to process file, command line input

## What the video covers
1. Two loops: `for` (one round per item in a list) and `while` (as long as a command succeeds).
2. `for fruit in apple banana cherry; do ... done`, `$fruit` is the variable's value.
3. A range: `{1..5}` expands to 1 2 3 4 5, also usable in a `for` loop.
4. Files: `for file in *.txt; do ... done`, with `wc -l "$file"` (count lines).
5. Command line input: `for name in "$@"; do ... done` loops over every argument; with no arguments it does nothing.
6. A file line by line: `while read -r line; do ... done < colors.txt`.
7. Reboot step (scripts are files on disk), then the practice task and checker.

## Honest limits
- Not covered: C-style `for ((...))`, `until`, `break` and `continue`, `select`, `$1` and `shift` (the next video covers script inputs), reading with a different separator (`IFS`), looping over command output (a later objective).
- `"$@"` is only introduced as "every argument"; the next video explains `$1`, `$2` and friends.
- The checker looks at the result (executable, first line `#!/bin/bash`, a `for` or `while` loop, greets three test names, prints nothing with no arguments).

## Sources
- The man pages on your own system: `man bash` (section: Compound Commands, and Special Parameters for `$@`), `man wc`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab17 loop1.sh count.sh files.sh hello.sh readfile.sh a.txt b.txt c.txt colors.txt`
