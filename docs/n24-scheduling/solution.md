# Solution

```
sleep 600 &
nice -n 5 sleep 601 &
pgrep -f "sleep 600"
renice -n 10 -p PID
bash check.sh
```

Replace `PID` with the number that `pgrep` printed. `ps -o pid,ni,args -C sleep` shows the niceness of both processes.
