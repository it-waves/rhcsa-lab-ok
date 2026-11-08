# Command reference: permissions

| Command | Meaning |
|---|---|
| `ls -l` | long listing; the first column is the permissions |
| `ls -ld dir` | list the directory itself, not its contents |
| `chmod u+x file` | give the user execute |
| `chmod g+w file` | give the group write |
| `chmod o-r file` | take read away from others |
| `chmod 640 file` | set all three groups at once (6, 4, 0) |
| `cd dir` | change directory |

## Reading the listing
`-rw-r--r--.` = type (`-` file, `d` directory), user `rw-`, group `r--`, others `r--`, then a dot (SELinux marker).

## The numbers
| Bit | Value |
|---|---|
| r | 4 |
| w | 2 |
| x | 1 |

Common modes: 644 `rw-r--r--`, 640 `rw-r-----`, 755 `rwxr-xr-x`, 750 `rwxr-x---`.

## Reading errors
| Message | Meaning |
|---|---|
| cat: x: Permission denied | the user lacks `r` on the file |
| bash: cd: x: Permission denied | the user lacks `x` on the directory |

## Commands from earlier videos used here
`mkdir` makes a directory; `echo` prints text; `>` writes output to a file; `touch` creates an empty file; `cat` shows a file; `ls` lists a directory.
