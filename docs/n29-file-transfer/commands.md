# Command reference

| Command | What it does |
|---|---|
| `scp FILE user@host:/path/` | send a file |
| `scp user@host:/path/FILE NAME` | fetch a file |
| `scp -r DIR user@host:/path/` | send a folder |
| `scp -P 2222 FILE user@host:/path/` | use another port (capital P) |
| `ssh user@host COMMAND` | run one command on the other system |
| `rsync -av DIR/ user@host:/path/` | sync the contents of DIR, only changes |
| `sftp user@host` | interactive session: `get`, `put`, `ls`, `bye` |
| `cmp A B` | compare two files; no output = identical |
