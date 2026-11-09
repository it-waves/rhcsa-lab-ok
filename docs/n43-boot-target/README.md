# Configure systems to boot into a specific target automatically

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Important lab note:** before the demo, the lab (not shown) runs `systemctl set-default graphical.target`, so there is a default to change. This step changes the system.

## Exam objective (exact wording)
Configure systems to boot into a specific target automatically

## What the video covers
1. A target is a goal systemd boots toward. `multi-user.target` is a full text system; `graphical.target` adds a desktop.
2. `systemctl get-default` prints the default target.
3. `sudo systemctl set-default multi-user.target` removes the old `default.target` link and creates a new one.
4. `ls -l /etc/systemd/system/default.target` shows the link itself.
5. After a reboot the default is still `multi-user.target`, that target is active, and `graphical.target` is inactive.

## Honest limits
- Not covered: `systemctl isolate` (switch now, without a reboot), `rescue.target` and `emergency.target`, and the `systemd.unit=` kernel argument.
- The lab VM has no desktop installed, so "graphical" is only a setting here.
- The demo leaves the default at `multi-user.target`; undo with `sudo systemctl set-default graphical.target`.
- The checker reads state only.

## Sources
- The man pages on your own system: `man systemctl`, `man systemd.special`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
