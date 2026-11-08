# Solution

```
mkdir lab4
grep -i error server.log > lab4/errors.txt
cat lab4/errors.txt
```

`-i` ignores case, so both `ERROR` lines and the lowercase `error` line match (3 lines). `>` sends grep's output into the file.
