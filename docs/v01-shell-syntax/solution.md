# V01 solution

## Task
```
mkdir -p ~/lab1 && touch ~/lab1/notes.txt
ls -l ~/lab1
bash check.sh
```
Expected (from the lab run in the video): `ls -l ~/lab1` lists one empty file, `notes.txt`, and the checker prints three PASS lines. The same result was confirmed again after a reboot.

## Broken attempts
1. `mkdir-p` has no space, so the shell looks for a command with that whole name. Fix: `mkdir -p ~/lab1`. (Same failure type as `ls-l` in the video: exit status 127.)
2. The unquoted space splits the name into two arguments, so `touch` creates two files: `~/lab1/my`, and `notes.txt` in whatever directory you are in (not in `~/lab1`). Fix: `rm ~/lab1/my` and remove the stray `notes.txt` from the current directory. If you do want a name with a space, quote only the name: `touch ~/lab1/"my notes.txt"`. The `~` is not expanded inside quotes.
3. `-z` is not a valid option for `ls`, so it prints a usage hint and exits with status 2. Fix: drop the option or look one up with `ls --help`.

Before you finish, make sure `~/lab1` contains only `notes.txt`.
