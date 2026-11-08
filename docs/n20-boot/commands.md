# Command reference

| Command | What it does |
|---|---|
| `uptime -p` | how long the machine has been up, in words |
| `who -b` | date and time of the last boot |
| `sudo shutdown -h +10` | power off in 10 minutes (`-h` = halt/power off) |
| `sudo shutdown -r +10` | reboot in 10 minutes (`-r` = reboot) |
| `sudo shutdown -c` | cancel a scheduled shutdown |
| `systemctl is-system-running --wait` | wait for startup to finish, then print the state |
| `sudo systemctl reboot` | clean stop, then restart |
| `sudo systemctl poweroff` | clean stop, stays off |
