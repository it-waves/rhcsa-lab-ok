# Boot systems into different targets manually

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The lab runs in a virtual machine on a build server with no keyboard at the boot menu, so the GRUB menu itself is shown only as a labelled illustration, not a capture.

## Exam objective (exact wording)
Boot systems into different targets manually

## What the video covers
1. A target is a goal state: `multi-user.target` (full text-mode system), `graphical.target` (adds a graphical login), `rescue.target` (small system with a root shell), `emergency.target` (only the root file system, read-only). Rescue and emergency ask for the root password.
2. At the boot menu: press `e` on the entry, add `systemd.unit=TARGET` at the end of the `linux` line, press `Ctrl+X`. This boots once and changes nothing permanent.
3. `systemctl get-default` (target used at a normal boot) and `systemctl is-active TARGET` (is it running now; exit status 3 means inactive).
4. `cat /proc/cmdline` shows the options the current boot started with.
5. Lab stand-in for the GRUB edit: `sudo grubby --update-kernel=ALL --args=systemd.unit=graphical.target` (saved in the boot entries, so it is permanent), `sudo grubby --info=DEFAULT` to see it.
6. After a reboot: the command line ends with the option, `systemctl get-default` prints a note that the kernel command line overrides the default, and `graphical.target` is active.
7. Clean up with `sudo grubby --update-kernel=ALL --remove-args=systemd.unit=graphical.target`.

## Honest limits
- The one-time GRUB edit is explained but not captured; `grubby` is used in the lab instead, and it is permanent until you remove the option.
- The lab has no desktop installed, so graphical.target looks no different on screen; the video shows that it is active.
- rescue.target and emergency.target are not booted in the lab (they need a console and the root password).
- Not covered: `systemctl isolate`, `systemctl set-default` (permanent default target), `rd.break` and resetting the root password (the next objective), the `rescue` and `emergency` systemctl commands, and BIOS/UEFI differences.
- The checker looks at the result (the boot used the option, graphical.target is active, target.txt says active, the default target is unchanged, and, if sudo works without a password, the option was removed from the boot entries).

## Sources
- The man pages on your own system: `man systemd.special` (targets), `man kernel-command-line`, `man systemctl`, `man grubby`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab21` and `sudo grubby --update-kernel=ALL --remove-args=systemd.unit=graphical.target`
