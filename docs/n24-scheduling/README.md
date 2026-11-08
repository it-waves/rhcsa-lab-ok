# Adjust process scheduling

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The lab starts the background jobs detached, so the job-number line a real shell prints after `&` is not shown.

## Exam objective (exact wording)
Adjust process scheduling

## What the video covers
1. Niceness (NI) is a number from -20 to 19, default 0. A high number means a nice process that lets others go first; a low number means a greedy one. It only matters when processes compete for the processor.
2. `nice` alone prints the niceness of the shell; `nice -n 10 COMMAND` starts a command with niceness 10.
3. Four busy processes on a two-core machine: two normal ones use almost a full core each (about 97 %), two started with `nice -n 19` get only a few percent. `ps -eo pid,ni,%cpu,comm --sort=-%cpu | head -n 6` shows it.
4. `renice -n 19 -p PID` changes a running process; `ps -o pid,ni,comm -p PID` confirms.
5. A normal user can only make a process nicer. Lowering the number (for example `renice -n -5 -p PID`) gives "Permission denied"; `sudo renice -n -5 -p PID` works.
6. `ps -C NAME -o pid,ni,comm` selects by command name. Niceness is not saved: after a reboot the process, and its niceness, are gone.

## Honest limits
- `%CPU` in `ps` is an average over the life of the process.
- The effect is visible because the lab VM has two cores and four busy processes.
- Not covered: `chrt` and real-time scheduling policies, `ionice`, `taskset`, systemd `Nice=` settings, and cgroup CPU weights.
- The checker looks at the result: a `sleep 600` process of yours with niceness 10, and a `sleep 601` process with niceness 5. Run it before you reboot, because a reboot ends the processes.

## Sources
- The man pages on your own system: `man nice`, `man renice`, `man ps`, `man sched`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `pkill sleep`
