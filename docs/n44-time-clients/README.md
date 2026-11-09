# Configure time service clients

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. The lab VM reaches public time servers over the internet; your servers and offsets will differ. The `chronyc sources` output after the reboot is shortened on screen and marked with `...`.

**Important lab note:** before the demo, the lab (not shown) installs the `chrony` package with `dnf`. This step changes the system.

## Exam objective (exact wording)
Configure time service clients

## What the video covers
1. chrony is the time client: the service is `chronyd`, the configuration is `/etc/chrony.conf`, the command is `chronyc`. The protocol is NTP.
2. `server NAME` names one time server, `pool NAME` a group of servers, `iburst` sends a quick burst of requests at start.
3. `grep -E '^(pool|server)' /etc/chrony.conf` shows the configured servers.
4. `echo 'server 0.pool.ntp.org iburst' | sudo tee -a /etc/chrony.conf` appends a server line.
5. `systemctl is-enabled chronyd`, `systemctl is-active chronyd`, `sudo systemctl restart chronyd` (chronyd reads its configuration at start).
6. `chronyc sources` lists the servers; `^*` is the one we are synchronized to, `^-` a good server not selected, `^?` not selected yet.
7. `timedatectl` shows `System clock synchronized: yes` and `NTP service: active`.
8. After a reboot chronyd is enabled and active; the sources show `^?` for a moment while chrony measures again.

## Honest limits
- Not covered: `chronyc tracking`, `makestep`, `chronyc makestep`, `timedatectl set-ntp`, `timedatectl set-time`, time zones, `allow` (serving time), `chrony.d` includes, and restricting servers by firewall.
- In the demo the first added server was not listed in the first 5 rows of `chronyc sources` after 20 seconds; the pool line already supplies sources.
- The demo leaves the extra `server 0.pool.ntp.org iburst` line in `/etc/chrony.conf`; remove it with `sudo vim /etc/chrony.conf` and `sudo systemctl restart chronyd`.
- The checker reads state only. The practice server name does not exist, so nothing synchronizes in the practice task.

## Sources
- The man pages on your own system: `man chrony.conf`, `man chronyc`, `man timedatectl`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
