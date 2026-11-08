# Command reference

| Item | What it does |
|---|---|
| `$(command)` | run the command, and swap in what it printed |
| `host=$(hostname -s)` | save the short host name in the variable host |
| `ls data \| wc -l` | pipe: count the files in data (`wc -l` counts lines) |
| `id -u` | print your user number (root is 0) |
| `[ "$(id -u)" -eq 0 ]` | true when the number equals 0 (`-eq` = equals, for numbers) |
| `for f in $(ls data); do ... done` | one round per name printed (breaks on spaces in names) |
| `wc -l < FILE` | count the lines in FILE, printing only the number |
