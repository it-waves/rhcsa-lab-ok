# Start, stop, and check the status of network services

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Start, stop, and check the status of network services

## What the video covers
1. A network service is a program that waits for connections on a port. systemd manages it; you use `systemctl`.
2. Two separate questions: is it running now (`active`)? Does it start at boot (`enabled`)? A service can be one without the other.
3. `ss -tln` lists listening TCP sockets (`-t` tcp, `-l` listening only, `-n` numbers). `sudo ss -tlnp` adds the owning program (`-p`). Port 22 is `sshd`; port 9090 is held by systemd for the web console.
4. `systemctl status NAME --no-pager | head -n 3` shows the name, Loaded/enabled and Active lines. `systemctl is-active NAME` and `systemctl is-enabled NAME` give short answers.
5. `sudo systemctl stop|start|restart NAME`. These print nothing when they work.
6. `sudo systemctl disable NAME` only changes the next boot: the service keeps running until it is stopped or the machine reboots.
7. `sudo systemctl enable --now NAME` enables for boot and starts now, in one command.

## Honest limits
- `is-active` and `is-enabled` exit with a non-zero code when the answer is `inactive` or `disabled`; that is normal, not an error.
- The video stops and starts `chronyd` (the time service). Do not stop `sshd` on a remote machine: you lose your own connection.
- Not covered: `systemctl mask`, socket units in depth, firewalld, `systemctl list-units`, and `journalctl -u` for service logs.
- The checker looks at the result: `chronyd` running and enabled, and `sshd` still running. The lab starts the task with `chronyd` stopped and disabled.

## Sources
- The man pages on your own system: `man systemctl`, `man ss`, `man chronyd`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `sudo systemctl enable --now chronyd`
