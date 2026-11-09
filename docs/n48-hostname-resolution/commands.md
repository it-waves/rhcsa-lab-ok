# Command reference

| Command | What it does |
|---|---|
| `grep '^hosts' /etc/nsswitch.conf` | order of name sources |
| `cat /etc/hosts` | names written by hand |
| `getent hosts NAME` | resolve a name like a program does |
| `echo 'ADDR NAME SHORT' \| sudo tee -a /etc/hosts` | add a line to /etc/hosts |
| `cat /etc/resolv.conf` | DNS server in use (made by NetworkManager) |
| `sudo nmcli connection modify CONN ipv4.dns SERVER` | set a DNS server on a connection |
| `nmcli -f ipv4.dns connection show CONN` | show the saved DNS server |
