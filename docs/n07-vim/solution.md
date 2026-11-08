# Solution

```
vim lab7.txt
```
Press `i`, type `alpha`, Enter, `beta`, Enter, `gamma`, then `Esc`, then `:wq` and Enter.

```
vim lab7.txt
```
Press `gg` (first line), `j` (down one line, onto `beta`), then `dd` (delete the line). Press `G` (last line), `o` (new line below), type `delta`, then `Esc`, then `:wq` and Enter.

Check with `cat lab7.txt`: the lines are `alpha`, `gamma`, `delta`.
