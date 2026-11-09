# Command reference

| Command | What it does |
|---|---|
| `ls -Z file` | show the current context |
| `matchpathcon file` | show the default context from the policy |
| `sudo restorecon -v file` | apply the default; `-v` says what changed |
| `sudo restorecon -Rv dir` | the same for a whole directory tree (`-R`) |
| `mv` | moves a file and keeps its label (can be wrong in the new place) |
