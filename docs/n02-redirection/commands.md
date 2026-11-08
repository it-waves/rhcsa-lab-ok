# Command reference: redirection

| Syntax | Meaning |
|---|---|
| `cmd > file` | write standard output to file, replacing it |
| `cmd >> file` | append standard output to file |
| `cmd1 \| cmd2` | send output of cmd1 to the input of cmd2 |
| `cmd 2> file` | write standard error to file |
| `cmd > a 2> b` | output to a, errors to b |
| `cmd > file 2>&1` | both streams to one file |
| `cmd 2> /dev/null` | discard errors |
| `cmd < file` | read standard input from file |
| `cmd \| tee file` | write to file and show on screen |

Stream numbers: 0 = stdin, 1 = stdout, 2 = stderr. Order matters: `> file 2>&1` works, `2>&1 > file` does not send errors to the file.
