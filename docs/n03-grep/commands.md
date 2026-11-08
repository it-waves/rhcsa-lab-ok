# Command reference: grep

| Command | Meaning |
|---|---|
| `grep word file` | print the lines that contain word |
| `grep -i word file` | ignore upper/lower case |
| `grep -v word file` | invert: lines that do NOT match |
| `grep -c word file` | count matching lines |
| `grep -n word file` | show line numbers |
| `grep -r word folder` | search every file in a folder |
| `grep -E 'a\|b' file` | extended expressions (or) |

## Pattern symbols (put the pattern in single quotes)
| Symbol | Meaning |
|---|---|
| `^` | start of line |
| `$` | end of line |
| `.` | any one character |
| `*` | repeat the previous thing, any number of times (including zero) |
| `[ab]` | one character from the set |
| `\|` (with -E) | or |
| `+` (with -E) | one or more of the previous thing |

## Commands from earlier videos used here
`cat file` shows a file; `ls` lists files; `mkdir` makes a directory; `sudo` runs a command as the administrator; `>` writes output into a file; `|` pipes output into the next command.
