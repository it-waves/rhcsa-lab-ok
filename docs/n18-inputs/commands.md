# Command reference

| Item | What it does |
|---|---|
| `$0` | the script's own name |
| `$1`, `$2` | the first and second argument |
| `$#` | how many arguments were given |
| `"$@"` | all the arguments |
| `"red green"` | quotes keep two words as one argument |
| `[ $# -lt 1 ]` | true when fewer than 1 argument (`-lt` = less than) |
| `exit 1` | stop the script with exit status 1 (failure) |
| `echo $?` | show the exit status of the last command |
| `${1:-world}` | `$1`, or `world` if there is none |
