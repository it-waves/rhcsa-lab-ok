# Command reference

| Command | What it does |
|---|---|
| `ip -br address` | one line per interface, with addresses |
| `sudo nmcli connection add type dummy ifname NAME con-name CONN` | new connection on a virtual interface |
| `sudo nmcli connection modify CONN ipv4.method manual ipv4.addresses ADDR/PREFIX` | static IPv4 address |
| `sudo nmcli connection modify CONN ipv6.method manual ipv6.addresses ADDR/PREFIX` | static IPv6 address |
| `sudo nmcli connection up CONN` | apply the connection |
| `nmcli -f FIELDS connection show CONN` | show saved settings |
| `sudo nmcli connection delete CONN` | remove a connection |
