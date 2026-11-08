# Solution

```
mkdir -p ~/lab3
ls /etc/hostname /nonexistent > ~/lab3/ok.txt 2> ~/lab3/err.txt
ls -l ~/lab3
```

`>` sends standard output to `ok.txt`, `2>` sends standard error to `err.txt`. `ok.txt` holds `/etc/hostname`; `err.txt` holds the "No such file or directory" message.
