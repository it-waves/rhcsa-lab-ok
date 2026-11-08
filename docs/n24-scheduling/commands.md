# Command reference

| Command | What it does |
|---|---|
| `nice` | print the niceness of the shell (default 0) |
| `nice -n 10 COMMAND` | start a command with niceness 10 |
| `renice -n 10 -p PID` | change the niceness of a running process |
| `sudo renice -n -5 -p PID` | give a negative niceness (only root can lower it) |
| `ps -eo pid,ni,%cpu,comm --sort=-%cpu` | processes with niceness and CPU use |
| `ps -o pid,ni,comm -p PID` | niceness of one process |
| `ps -C NAME -o pid,ni,comm` | processes selected by command name |
| `pgrep -f TEXT` | PIDs whose command line contains TEXT |
