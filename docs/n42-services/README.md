# Start and stop services and configure services to start automatically at boot

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Important lab note:** before the demo, the lab (not shown) installs the `httpd` package with `dnf`. This step changes the system.

## Exam objective (exact wording)
Start and stop services and configure services to start automatically at boot

## What the video covers
1. `systemctl` is the tool for services. Two separate questions: running now (`start` / `stop`) and running after a reboot (`enable` / `disable`).
2. `systemctl status httpd` shows `Loaded: ... disabled` and `Active: inactive (dead)`.
3. `sudo systemctl start httpd`, `systemctl is-active httpd`, `sudo systemctl restart httpd`, `sudo systemctl stop httpd`.
4. `systemctl is-enabled httpd`, `sudo systemctl enable httpd` (creates a symlink). Enable does not start the service: `is-active` still says `inactive`.
5. `sudo systemctl enable --now httpd` enables and starts in one command.
6. After a reboot the service is enabled and active without anyone starting it.

## Honest limits
- Not covered: `disable`, `mask` and `unmask`, `reload`, `is-failed`, `list-units`, `systemctl edit`, and `journalctl`. The practice task uses `disable --now`.
- The checker reads state only.
- The demo leaves httpd enabled; undo with `sudo systemctl disable --now httpd`.

## Sources
- The man pages on your own system: `man systemctl`, `man systemd.service`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
