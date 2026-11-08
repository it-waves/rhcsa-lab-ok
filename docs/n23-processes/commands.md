# Command reference

| Command | What it does |
|---|---|
| `yes > /dev/null &` | busy process: prints y forever, output thrown away, runs in the background |
| `ps aux --sort=-%cpu \| head -n 4` | processes, biggest CPU use first, first four lines |
| `ps aux --sort=-%mem \| head -n 4` | same, biggest memory use first |
| `ps -eo pid,comm,%cpu,%mem --sort=-%cpu` | every process, only the columns you choose |
| `top -b -n 1 \| head -n 12` | one batch snapshot of top (interactive: `P` CPU, `M` memory, `q` quit) |
| `pgrep -x NAME` | PIDs of processes with exactly that name |
| `kill PID` | send signal 15 (TERM), a polite request |
| `kill -9 PID` | send signal 9 (KILL), cannot be refused, last resort |
| `pkill NAME` | send signal 15 to every process with that name |
| `ps -p PID` | show one process; only the header = it is gone |
| `uptime -p` | how long the machine has been up |
