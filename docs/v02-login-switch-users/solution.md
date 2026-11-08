# V02 solution

One way (non-interactive, as in the lab run):
```
sudo su - alice -c "touch ~/lab2.txt"
sudo ls -l /home/alice/lab2.txt
bash check.sh
```
Expected from the lab run: the file is listed as owned by alice, group alice, size 0, and the checker prints three PASS lines. The same was confirmed after a reboot.

Interactive version: `su - alice` (or `sudo -iu alice`), then `touch ~/lab2.txt`, `ls -l ~`, `exit`.
Note: alice's home is not readable by student, so list it with `sudo`.
