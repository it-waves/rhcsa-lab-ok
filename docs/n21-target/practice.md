# Practice task: boot with a target option

Work as `student`, using `sudo` where needed.

1. Add the kernel option `systemd.unit=graphical.target` to all boot entries (use `grubby`).
2. Reboot the machine.
3. After it is back, create the folder `lab21` in your home directory.
4. Save the output of `systemctl is-active graphical.target` in the file `lab21/target.txt`.
5. Remove the option again, so later boots are normal.
6. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
