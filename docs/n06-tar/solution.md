# Solution

```
tar -czf backup.tar.gz project
mkdir lab6
tar -xzf backup.tar.gz -C lab6
ls lab6/project
```

`-czf` creates a gzip-compressed archive. `-xzf` extracts one, and `-C lab6` makes tar change into `lab6` first, so the files land there. You should see `readme.txt` and `services` listed.
