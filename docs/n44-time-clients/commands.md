# Command reference

| Command | What it does |
|---|---|
| `grep -E '^(pool\|server)' /etc/chrony.conf` | show configured time servers |
| `echo 'server NAME iburst' \| sudo tee -a /etc/chrony.conf` | append a time server |
| `sudo systemctl enable --now chronyd` | start chrony now and at boot |
| `sudo systemctl restart chronyd` | re-read the configuration |
| `chronyc sources` | list the servers in use |
| `timedatectl` | clock, time zone and NTP status |
