# Set enforcing and permissive modes for SELinux

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Nothing is silent in the demo.** It changes the mode at runtime (`setenforce 0`, then `setenforce 1`), then edits `/etc/selinux/config` to `SELINUX=permissive`, reboots, and puts everything back to `enforcing` at the end (the last step of the capture). Nothing is prepared silently in the practice lab either.

## Exam objective (exact wording)
Set enforcing and permissive modes for SELinux

## What the video covers
1. The three modes: enforcing (blocks and logs), permissive (logs only), disabled (off; avoid it, turning it back on needs a full relabel).
2. `getenforce` shows the running mode; `grep '^SELINUX=' /etc/selinux/config` shows the mode for the next boot; `sestatus` shows both ("Current mode" and "Mode from config file").
3. `sudo setenforce 0` (permissive) and `sudo setenforce 1` (enforcing) change the running system only; they are lost at the next reboot and cannot select disabled.
4. `sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config` sets the mode for the next boot; the running mode does not change.
5. After the reboot the system is permissive; the demo then restores enforcing.

## Honest limits
- Not covered: the `enforcing=0` boot parameter, the `SELINUXTYPE` setting, `semodule`, reading the audit log (`ausearch`, `sealert`), relabeling (`touch /.autorelabel`), and per-domain permissive mode (`semanage permissive`).
- Permissive mode is for troubleshooting. Do not leave a production system there.

## Sources
- The man pages on your own system: `man getenforce`, `man setenforce`, `man sestatus`, `man selinux`, `man selinux-config`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
