# Command reference

| Command | What it does |
|---|---|
| `for x in a b c; do ... done` | run the commands once for each item |
| `echo {1..5}` | expands to 1 2 3 4 5 |
| `for f in *.txt; do ... done` | one round per file matching the pattern |
| `wc -l FILE` | count the lines in FILE |
| `for a in "$@"; do ... done` | one round per script argument |
| `while read -r line; do ... done < FILE` | read FILE one line at a time |
