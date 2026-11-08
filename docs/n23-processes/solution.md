# Solution

```
mkdir lab23
yes > /dev/null &
ps aux --sort=-%cpu | head -n 3
echo PID > lab23/pid.txt
kill PID
bash check.sh
```

Replace `PID` with the number you saw in the second column of the `yes` line. `pgrep -x yes` also prints it.
