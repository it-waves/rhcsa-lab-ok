# Command reference

| Command | What it does |
|---|---|
| `sudo systemctl enable --now firewalld` | start the firewall now and at boot |
| `sudo firewall-cmd --state` | is it running? |
| `sudo firewall-cmd --list-services` | allowed services |
| `sudo firewall-cmd --list-ports` | open ports |
| `sudo firewall-cmd --permanent --add-service=NAME` | allow a service (saved rules) |
| `sudo firewall-cmd --permanent --add-port=PORT/tcp` | open a port (saved rules) |
| `sudo firewall-cmd --permanent --remove-service=NAME` | block a service again (saved rules) |
| `sudo firewall-cmd --reload` | apply the saved rules to the running firewall |
