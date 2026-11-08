# Command reference: install and remove RPM packages

| Command | Meaning |
|---|---|
| `rpm -q name` | is this package installed? (prints its version if so) |
| `dnf info name` | details of a package: version, size, repository, summary |
| `dnf search word` | look for a word in package names and summaries |
| `sudo dnf -y install name` | install a package from a repository, answer yes |
| `rpm -ql name` | list the files an installed package put on the system |
| `rpm -qf /path/to/file` | which installed package owns this file? |
| `dnf download name` | save the .rpm file into the current folder without installing |
| `sudo dnf -y install ./file.rpm` | install from a package file (dependencies come from repositories) |
| `sudo dnf -y remove name` | uninstall a package |
| `sudo dnf history` | list every package change with an id, command and date |
| `dnf provides /path/to/file` | which package supplies this file (installed or not)? |

## Reading messages
| Message | Meaning |
|---|---|
| package tree is not installed | `rpm -q` found nothing |
| bash: tree: command not found | the program is not installed (or not in PATH) |
| Repo : @System | the package is installed on this machine now |

## Commands from earlier videos used here
`ls` lists a directory; `mkdir` makes a directory; `echo text > file` writes text to a file; `sudo` runs as administrator; `dnf -y` answers yes (V12).
