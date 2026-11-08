# Command reference: tar, gzip, bzip2

| Command | Meaning |
|---|---|
| `tar -cf a.tar dir` | create an archive (no compression) |
| `tar -tf a.tar` | list what is inside |
| `tar -xf a.tar -C dest` | extract into the directory `dest` |
| `tar -czf a.tar.gz dir` | create a gzip-compressed archive |
| `tar -cjf a.tar.bz2 dir` | create a bzip2-compressed archive |
| `tar -xzf a.tar.gz` / `tar -xjf a.tar.bz2` | extract them |
| `gzip file` / `gunzip file.gz` | compress / uncompress one file (replaces it) |
| `bzip2 file` / `bunzip2 file.bz2` | same, with bzip2 (smaller, slower) |
| `sudo dnf install -y bzip2` | install the bzip2 program if it is missing |

Note: `-f` takes the next word as the archive name, so it goes last in the option group.

## Commands from earlier videos or used here for the first time
`mkdir` makes a directory; `cp` copies a file; `ls -l` lists with sizes; `echo text > file` writes text into a file; `sudo` runs one command as administrator.
