# Command reference: RPM repositories

| Command | Meaning |
|---|---|
| `ls /etc/yum.repos.d` | list the repository definition files |
| `dnf repolist` | repositories that are turned on |
| `dnf repolist --all` | include disabled repositories |
| `sudo dnf -y install createrepo_c` | install the tool that writes repository catalogs |
| `dnf download --destdir DIR pkg` | save a package file into DIR without installing it |
| `createrepo_c DIR` | build the `repodata` catalog inside DIR |
| `sudo dnf config-manager --add-repo URL` | write a `.repo` file for URL (`file://`, `http://`, `https://`) |
| `dnf repoinfo ID` | details of one repository |
| `dnf --repo=ID list available` | packages offered by that repository only |
| `sudo dnf config-manager --set-disabled ID` | turn a repository off, keep its file |
| `sudo dnf config-manager --set-enabled ID` | turn it back on |
| `sudo dnf config-manager --save --setopt=ID.gpgcheck=0` | change one setting in the repository file |

## Parts of a .repo file
| Line | Meaning |
|---|---|
| `[id]` | the repository id, used in commands |
| `name=` | a label |
| `baseurl=` | where the packages and `repodata` are |
| `enabled=1` | 1 = on, 0 = off |
| `gpgcheck=` | 1 = verify package signatures, 0 = do not (lab use only) |

## Commands from earlier videos used here
`ls` lists a directory; `cat` shows a file; `head -n 12` shows the first 12 lines; `mkdir` makes a directory; `sudo` runs as administrator; `dnf -y install` installs a package.
