# Command reference: creating and editing text files

| Command | Meaning |
|---|---|
| `touch file` | create an empty file (or update its time) |
| `echo text > file` | write text into a file, replacing its content |
| `echo text >> file` | add text to the end of a file |
| `cat file` | show a file |
| `vim file` | open a file in vim (starts in normal mode) |
| `sudo dnf install -y vim-enhanced` | install the vim command if it is missing |

## vim keys
| Key | Meaning |
|---|---|
| `i` | insert before the cursor |
| `o` | open a new line below and insert |
| `Esc` | back to normal mode |
| `gg` / `G` | first line / last line |
| `dd` | delete the current line |
| `u` | undo |
| `/text` then Enter | search forward |
| `:w` / `:q` / `:wq` / `:q!` | save / quit / save and quit / quit and discard |

## Commands from earlier videos used here
`ls -l` lists with sizes; `which` shows where a command is installed; `sudo` runs one command as administrator; `dnf` installs software.
