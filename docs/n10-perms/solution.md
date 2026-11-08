# Solution

```
mkdir lab10
touch lab10/notes.txt
chmod 640 lab10/notes.txt
mkdir lab10/shared
chmod 750 lab10/shared
ls -l lab10
```

Expected: `-rw-r-----` for `notes.txt` and `drwxr-x---` for `shared`. 640 = rw- (6), r-- (4), --- (0). 750 = rwx (7), r-x (5), --- (0).
