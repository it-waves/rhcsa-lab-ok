# Schedule tasks using at, cron and systemd timer units

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. Long `systemctl list-timers` output is shortened on screen and marked with `...`.

**Important lab note:** before the demo, the lab (not shown) installs the `at` and `cronie` packages and runs `systemctl enable --now atd crond`. These steps change the system.

## Exam objective (exact wording)
Schedule tasks using at, cron and systemd timer units

## What the video covers
1. Three tools: `at` runs once, later; cron runs on a schedule; a systemd timer starts a systemd service on a schedule.
2. `echo "date > /tmp/at.log" | at now + 1 minute`, then `atq` lists waiting jobs.
3. `echo "* * * * * date >> /tmp/cron.log" | crontab -` replaces the user's whole cron table (daily use: `crontab -e`, which opens vim); `crontab -l` lists it. The five fields are minute, hour, day of month, month, day of week.
4. A timer needs two unit files in `/etc/systemd/system`: `hello.service` (`Type=oneshot`, `ExecStart=`) and `hello.timer` (`OnCalendar=minutely`, `WantedBy=timers.target`).
5. `sudo systemctl daemon-reload`, `sudo systemctl enable --now hello.timer`, `systemctl list-timers hello.timer`.
6. After `sleep 75` all three have written the time to their log; `atq` is empty because an at job runs once.
7. After a reboot the cron table and the enabled timer are still there.

## Honest limits
- Not covered: `/etc/cron.d`, `/etc/crontab`, `cron.allow` and `cron.deny`, `at.allow`, `batch`, `anacron`, `OnBootSec` and `OnUnitActiveSec`, `Persistent=`, user timers, `systemd-analyze calendar`, and cron mail.
- The cron and timer jobs in the demo keep running every minute; remove them with `crontab -r` and `sudo systemctl disable --now hello.timer`.
- The checker reads state only; it does not wait for any job to run.

## Sources
- The man pages on your own system: `man at`, `man crontab`, `man 5 crontab`, `man systemd.timer`, `man systemd.service`, `man systemd.time`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
