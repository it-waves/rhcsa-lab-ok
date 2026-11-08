# Practice task: send and back up

Work as `student`.

**Setup (once).** Create the practice files, and an ssh key so that `localhost` accepts you without a prompt:

```
echo 'exam notes' > ~/exam.txt
mkdir -p ~/docs
echo one > ~/docs/a.txt
echo two > ~/docs/b.txt
ssh-keygen -q -t ed25519 -N "" -f ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
ssh-keyscan -t ed25519 localhost >> ~/.ssh/known_hosts
```

**Task.**

1. With `scp`, copy `~/exam.txt` to `student@localhost:/tmp/exam-copy.txt`.
2. With `rsync -av`, back up the folder `~/docs` to `student@localhost:/tmp/docs-backup/`.
3. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
