# Configure network services to start automatically at boot

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**One step is done silently before the demo:** the lab makes sure `rpcbind` is disabled and stopped (`sudo systemctl disable --now rpcbind.service rpcbind.socket`) so it can be re-run. This is said in the video. The demo itself changes the system: it enables and starts `rpcbind`.

## Exam objective (exact wording)
Configure network services to start automatically at boot

## What the video covers
1. Two different questions: enabled (starts at boot) and active (running now).
2. `systemctl is-enabled NAME` and `systemctl is-active NAME`.
3. `ss -tln | grep ':111 '` shows whether something listens on a TCP port (`-t` TCP, `-l` listening, `-n` numbers).
4. `sudo systemctl enable --now NAME` creates the boot link and starts the service.
5. After a reboot the service is enabled and active again.

## Honest limits
- Only `rpcbind` is demonstrated; `rpcbind` normally also has a socket unit, which is not discussed.
- Not covered: `systemctl start/stop` on their own (see the earlier video on starting and stopping services), `systemctl mask`, firewall rules (the next video), SELinux ports, and services that need configuration before they start.
- The demo leaves `rpcbind` enabled and running; undo with `sudo systemctl disable --now rpcbind.service rpcbind.socket`.
- The checker reads state only.

## Sources
- The man pages on your own system: `man systemctl`, `man ss`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
