# Command reference: system documentation

| Command | Meaning |
|---|---|
| `man -k word` | search page descriptions for a keyword (same as `apropos`) |
| `whatis name` | one-line summary and section of a command |
| `sudo mandb -q` | build or refresh the page index (quietly) |
| `man -w ls` | print where the page file lives |
| `man ls` | open the page for `ls` |
| `man 5 passwd` | open the page from a given section |
| `info ls` | open the GNU manual for `ls` |
| `rpm -qd package` | list the documentation files of an installed package |
| `ls /usr/share/doc` | one folder per installed package, with README, FAQ and similar |
| `head -n 8 file` | first 8 lines of a file |
| `sudo dnf install -y man-pages info` | install the extra pages and the info reader |

## In the pager (less)
| Key | Action |
|---|---|
| Space | next screen |
| `/text` then Enter | search forward |
| `n` | next match |
| `q` | quit |

## Man sections
| Section | Holds |
|---|---|
| 1 | user commands |
| 5 | file formats |
| 8 | system administration commands |

## Reading errors
| Message | Meaning |
|---|---|
| word: nothing appropriate. | the index has no match, or the index is not built |
| No manual entry for passwd in section 5 | that page is not installed |
| bash: info: command not found | the info package is not installed |

## Commands from earlier videos used here
`ls` lists a directory; `echo` prints text; `>` writes output to a file; `|` sends output to the next command; `cat` shows a file; `mkdir` makes a directory.
