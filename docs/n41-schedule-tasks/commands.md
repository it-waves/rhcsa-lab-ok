# Command reference

| Command | What it does |
|---|---|
| `echo "COMMAND" \| at now + 1 minute` | run a command once, later |
| `atq` | list waiting at jobs |
| `atrm NUMBER` | remove an at job |
| `crontab -e` | edit your cron table (opens vim) |
| `crontab -l` | list your cron table |
| `echo 'LINE' \| crontab -` | replace the whole table with this line |
| `* * * * *` | minute, hour, day of month, month, day of week |
| `sudo systemctl daemon-reload` | re-read unit files |
| `sudo systemctl enable --now NAME.timer` | start a timer now and at boot |
| `systemctl list-timers` | next and last run of timers |
