# Practice task: find and stop a CPU hog

Work as `student`.

1. Create the folder `lab23` in your home directory.
2. Start a busy process: `yes > /dev/null &`
3. Use `ps` sorted by CPU to find its PID.
4. Save that PID (just the number) in the file `lab23/pid.txt`.
5. Stop the process with `kill`.
6. Run the checker (`bash check.sh`) before you reboot.

The solution is in `solution.md`. Try first.
