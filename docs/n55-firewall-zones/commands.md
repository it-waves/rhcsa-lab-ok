# Command reference

| Command | What it does |
|---|---|
| `sudo firewall-cmd --get-default-zone` | the default zone |
| `sudo firewall-cmd --get-active-zones` | zones in use, with their interfaces |
| `sudo firewall-cmd --list-all` | everything in the default zone |
| `sudo firewall-cmd --zone=NAME --list-ports` | open ports in a zone |
| `sudo firewall-cmd --list-services` | allowed services |
| `sudo firewall-cmd --add-service=NAME` | allow a service (runtime only) |
| `sudo firewall-cmd --permanent --zone=NAME --add-port=PORT/tcp` | open a port, saved on disk |
| `sudo firewall-cmd --runtime-to-permanent` | save the running rules to disk |
| `sudo firewall-cmd --reload` | read the saved rules again (runtime rules are lost) |
| `sudo firewall-cmd --set-default-zone=NAME` | change the default zone (saved at once) |
