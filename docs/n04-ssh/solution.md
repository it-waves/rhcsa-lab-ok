# Solution

```
mkdir lab5
ssh localhost hostname > lab5/remote-host.txt
cat lab5/remote-host.txt
```

`ssh localhost hostname` runs `hostname` on the remote machine and prints the result here; `>` then writes that output into the file on this side. The file holds `node1` on the course lab.
