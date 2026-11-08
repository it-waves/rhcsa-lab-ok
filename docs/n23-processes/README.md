# Identify CPU/memory intensive processes and kill processes

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The lab starts the background jobs detached, so the job-number line a real shell prints after `&` is not shown.

## Exam objective (exact wording)
Identify CPU/memory intensive processes and kill processes

## What the video covers
1. A process is a running program with a PID; `%CPU` and `%MEM` show how much processor and memory it uses.
2. Signals: `kill PID` sends signal 15 (TERM, a polite request); `kill -9 PID` sends signal 9 (KILL, cannot be refused, no clean up, last resort).
3. Start trouble: `yes > /dev/null &` (one busy core, in the background) and a small Python script that holds about 300 MB of memory.
4. `ps aux --sort=-%cpu | head -n 4` (biggest CPU users first), `top -b -n 1 | head -n 12` (batch mode, once; interactively `P` sorts by CPU, `M` by memory, `q` quits), `ps aux --sort=-%mem | head -n 4`, and `ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 4` (choose your own columns).
5. Stop processes: `pgrep -x NAME`, `kill PID`, `ps -p PID` (only the header means it is gone), `pkill NAME`, `kill -9 PID`.
6. A reboot ends every process.

## Honest limits
- `%CPU` in `ps` is an average over the life of the process; `top` shows the current value.
- The lab waits until the boot-time background jobs have finished, so the hogs are clearly at the top.
- Not covered: `killall`, `nice` and `renice` (the next objective), `kill -STOP/-CONT`, `kill -l` and the other signals, cgroups and OOM killer, `htop`.
- The checker looks at the result: `lab23/pid.txt` holds a PID, that process is gone, and no `yes` process of yours is running. Run it before you reboot, because after a reboot PIDs can be reused.

## Sources
- The man pages on your own system: `man ps`, `man top`, `man kill`, `man pgrep` (also covers `pkill`), `man 7 signal`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab23` and `pkill yes`
