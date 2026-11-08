# Solution

```
scp ~/exam.txt student@localhost:/tmp/exam-copy.txt
rsync -av ~/docs/ student@localhost:/tmp/docs-backup/
bash check.sh
```

`ssh student@localhost ls /tmp/docs-backup` shows what arrived. Note the slash after `~/docs`: without it rsync would create `/tmp/docs-backup/docs`.
