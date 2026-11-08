# Boot, reboot, and shut down a system normally

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The lab runs in a virtual machine on a build server, so the boot itself (firmware, boot menu) is not shown.

## Exam objective (exact wording)
Boot, reboot, and shut down a system normally

## What the video covers
1. Three actions: boot (start), reboot (clean stop, then start), power off (clean stop, stays off).
2. `systemctl reboot` and `systemctl poweroff`; the `shutdown` command does the same and can wait: `shutdown -r +10` (reboot in 10 minutes), `shutdown -h +10` (power off in 10 minutes).
3. Look first: `uptime -p` (how long it has been up) and `who -b` (time of the last boot).
4. Schedule a shutdown with `sudo shutdown -h +10`, then cancel it with `sudo shutdown -c`.
5. `systemctl is-system-running --wait` waits until startup has finished, then prints the state (normally `running`).
6. A real reboot with `sudo systemctl reboot`, then the same checks after the boot.

## Honest limits
- Power off is explained but not run in the lab, because it would end the virtual machine.
- Not covered: `shutdown now` vs `reboot` vs `halt` differences in detail, wall messages, `shutdown --no-wall`, forced or emergency reboots (`reboot -f`), booting into other targets (the next video), the GRUB menu, and console access.
- The state can be `starting` right after a boot (the first lab run showed it), which is why `--wait` is used; `degraded` means a service failed and is a different topic.
- The checker looks at the result (boot.txt holds the current boot time, the system finished booting, and no shutdown is scheduled).

## Sources
- The man pages on your own system: `man shutdown`, `man systemctl` (reboot, poweroff, is-system-running), `man uptime`, `man who`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab20`
