# Command reference: files and directories

| Command | Meaning |
|---|---|
| `mkdir dir` | create a directory |
| `mkdir -p a/b/c` | create the whole chain, parents included |
| `ls -R dir` | list a directory and everything inside it |
| `touch file` | create an empty file |
| `echo text > file` | create a file holding text (replaces content) |
| `cp src dest` | copy a file; if dest is a directory the copy goes inside it |
| `cp -r dir newdir` | copy a directory and its contents |
| `mv src dest` | move; in the same folder it renames |
| `rm file` | delete a file (no trash can) |
| `rmdir dir` | delete an empty directory |
| `rm -r dir` | delete a directory and everything in it |

## Reading errors
| Message | Meaning |
|---|---|
| rm: cannot remove 'x': Is a directory | `rm` needs `-r` for directories |
| rmdir: failed to remove 'x': Directory not empty | `rmdir` only removes empty directories |

## Commands from earlier videos used here
`echo` prints text; `>` writes output to a file; `touch` creates an empty file; `ls` lists a directory; `cat` shows a file.
