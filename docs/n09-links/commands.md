# Command reference: links

| Command | Meaning |
|---|---|
| `ln existing new` | hard link: a second name for the same data |
| `ln -s target linkname` | soft (symbolic) link: a small file that stores a path |
| `ls -l` | long listing; the number after the permissions is the link count |
| `ls -li` | long listing with the inode number first |
| `readlink linkname` | print where a soft link points |
| `echo text >> file` | append a line to a file (`>` would replace it) |

## What to remember
| | Hard link | Soft link |
|---|---|---|
| Inode | same as the original | its own |
| Original deleted | still works | broken |
| Across filesystems | no | yes |
| To a directory | no | yes |

## Reading errors
| Message | Meaning |
|---|---|
| cat: x: No such file or directory (on a soft link) | the link is broken: its target no longer exists |

## Commands from earlier videos used here
`mkdir` makes a directory; `echo` prints text; `>` writes output to a file; `cat` shows a file; `ls` lists a directory; `rm` deletes a file.
