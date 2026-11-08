# Locate and interpret system log files and journals

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited, except that the long `sshd` line is cut after the port number (marked with `...`) in the "read one line" scene.

## Exam objective (exact wording)
Locate and interpret system log files and journals

## What the video covers
1. Two places hold logs: the journal (kept by `systemd-journald`, read with `journalctl`) and text files in `/var/log` (written by `rsyslog`).
2. `/var/log/messages` is general system messages, `/var/log/secure` is logins and sudo, `/var/log/cron` is scheduled jobs. `rpm -q rsyslog` and `ls /var/log/messages /var/log/secure` show they exist on the lab image; `ls -d /var/log/journal` shows the journal is kept on disk.
3. `sudo journalctl -u kdump -n 3 --no-pager`: `-u` one unit, `-n 3` last three lines, `--no-pager` print straight to the screen.
4. `-k` kernel messages only; `-p err -b` errors of this boot (here: no entries); `-b -1` the previous boot.
5. Reading a line: time, host name, program and `[process number]`, then the message.
6. `logger -t TAG "text"` writes a message; `journalctl -t TAG` finds it; `--since "5 minutes ago"` limits by time; `journalctl -b | wc -l` counts the lines of this boot.
7. `journalctl --list-boots` lists every boot kept (0 is this boot, -1 the one before).

## Honest limits
- On this image the journal is already stored under `/var/log/journal`, so it survives a reboot. Making it persistent on a system where it is not is the next objective (preserve system journals).
- The captured `/var/log/secure` and journal lines for `sudo` contain a masked field on the lab runner, so the video does not show them.
- Not covered: `journalctl -f` (follow), `-o` output formats, `--until`, priorities other than `err`, and reading `/var/log/audit`.
- The checker looks at the result: a journal message with tag `ex200` and text `practice message`, and the file `~/ex200.log` containing it.

## Sources
- The man pages on your own system: `man journalctl`, `man logger`, `man rsyslog.conf`, `man systemd-journald`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -f ~/ex200.log`
