# V01 practice task

Work as `student` on node1. Do not look at solution.md until you have tried.

## Task
Create a directory named `lab1` in your home directory. Inside it create an empty file named `notes.txt`. The directory must contain nothing else.

## Check yourself
Run `bash check.sh`. Three PASS lines means done. Then reboot (`sudo systemctl reboot`), log in, and run the checker again.

## Three broken attempts: find the mistake in each
Run each one, read the message and the exit status (`echo $?`), then fix it.
1. `mkdir-p ~/lab1`
2. `touch ~/lab1/my notes.txt`
3. `ls -z ~/lab1`

Hint: the video shows the same kinds of mistake (a missing space, an unquoted space, an invalid option). After each attempt, `ls -l ~/lab1` shows what actually happened. Clean up so `~/lab1` ends with only `notes.txt`.
