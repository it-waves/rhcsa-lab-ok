# Practice task: regain root access

You need console access to a practice machine (not only ssh).

1. Reboot. At the GRUB menu press `e` on the first entry.
2. Add `rd.break` at the end of the `linux` line. Boot with `Ctrl+X`.
3. Press Enter for maintenance when asked.
4. Make `/sysroot` writable, and change root into it.
5. Set a new password for root.
6. Make SELinux relabel the files on the next boot.
7. Leave the shell and let the machine boot.
8. Log in and run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
