# Command reference

| Command | What it does |
|---|---|
| `test -f FILE` / `[ -f FILE ]` | true if FILE is a regular file |
| `[ -d DIR ]` | true if DIR is a directory |
| `[ -e PATH ]` | true if PATH exists |
| `[ "$a" -eq 7 ]` | numbers: -eq -ne -gt -lt -ge -le |
| `[ "$a" = "text" ]` | text: = and != |
| `echo $?` | exit status of the last command |
| `command1 && command2` | run command2 only if command1 succeeded |
| `command1 \|\| command2` | run command2 only if command1 failed |
| `chmod +x script.sh` | make a script executable |
| `./script.sh` | run a script in the current folder |
