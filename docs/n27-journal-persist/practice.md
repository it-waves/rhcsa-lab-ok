# Practice task: persistent journal

Work as `student` (use `sudo` where needed).

1. Create the folder `/etc/systemd/journald.conf.d`.
2. Put a file there (any name ending in `.conf`) that sets `Storage=persistent` in the `[Journal]` section.
3. Restart `systemd-journald`.
4. Run the checker (`bash check.sh`).
5. Reboot, then run the checker again and look at `journalctl --list-boots`.

The solution is in `solution.md`. Try first.
