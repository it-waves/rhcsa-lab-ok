# Process script inputs ($1, $2, etc.)

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The script files are created for you by the lab script (typing them in vim gives the same files).

## Exam objective (exact wording)
Process script inputs ($1, $2, etc.)

## What the video covers
1. Arguments are the words after the script name: `./args.sh red green blue`.
2. `$0` is the script's own name, `$1` the first argument, `$2` the second, `$#` how many, `"$@"` all of them.
3. No arguments gives empty values and a count of 0; quotes keep `"red green"` as one argument.
4. Check the input: `if [ $# -lt 1 ]; then ... exit 1; fi` prints a usage message and stops with status 1; `echo $?` shows the status.
5. A default value: `${1:-world}` is `$1`, or `world` when there is no `$1`.
6. Reboot step (scripts are files on disk), then the practice task and checker.

## Honest limits
- Not covered: `shift`, `$*` versus `"$@"` in depth, `getopts` options, arguments past `$9` (`${10}`), reading input with `read`.
- The checker looks at the result (executable, first line `#!/bin/bash`, prints the right sentence for two test pairs, and a Usage line with exit status 1 when fewer than 2 arguments are given).

## Sources
- The man pages on your own system: `man bash` (section: Special Parameters, and Parameter Expansion for `${1:-word}`).
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab18 args.sh greet.sh hi.sh`
