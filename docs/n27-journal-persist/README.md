# Preserve system journals

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Preserve system journals

## What the video covers
1. The journal lives in memory (`/run/log/journal`, lost at every reboot) or on disk (`/var/log/journal`, kept).
2. `Storage=` in the journald configuration: `auto` keeps it on disk only if `/var/log/journal` exists; `persistent` always keeps it on disk and creates the folder; `volatile` is memory only.
3. On the lab image both folders already exist, so the journal was already kept on disk (through `auto`). `ls -d` and `journalctl --disk-usage` show this.
4. `/etc/systemd/journald.conf` does not exist on this image; the defaults are in `/usr/lib/systemd/journald.conf` (`#Storage=auto`). You add your own file under `/etc/systemd/journald.conf.d/`.
5. `sudo mkdir -p /etc/systemd/journald.conf.d`, then `printf '[Journal]\nStorage=persistent\n' | sudo tee /etc/systemd/journald.conf.d/persistent.conf`.
6. `sudo systemctl restart systemd-journald` reads the setting; `sudo journalctl --flush` moves the in-memory journal to disk.
7. After a reboot `journalctl --list-boots` shows both boots: the old logs are kept.

## Honest limits
- Because this image already kept the journal on disk, the video cannot show logs being lost; it shows the explicit, safe configuration instead. On a system without `/var/log/journal` and with `Storage=auto`, the same drop-in is what makes the journal survive a reboot.
- Not covered: size limits (`SystemMaxUse=`), `journalctl --vacuum-size`, `--vacuum-time`, and `--verify`.
- The checker looks at the result: `Storage=persistent` in `journald.conf` or in a file under `journald.conf.d`, the folder `/var/log/journal`, and the service running.

## Sources
- The man pages on your own system: `man journald.conf`, `man journalctl`, `man systemd-journald`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `sudo rm /etc/systemd/journald.conf.d/persistent.conf`
