# Command reference

| Command | What it does |
|---|---|
| `sudo semanage port -l` | list all port labels |
| `sudo semanage port -l -C` | list only the local changes |
| `sudo semanage port -a -t TYPE -p tcp PORT` | add a port to a type |
| `sudo semanage port -m -t TYPE -p tcp PORT` | modify a port that already has a label |
| `sudo semanage port -d -t TYPE -p tcp PORT` | delete the local change |
| `grep -w 8080` | keep the lines with 8080 as a whole word |

`-t` is the type, `-p` the protocol (tcp or udp). Changes made with semanage are permanent.
