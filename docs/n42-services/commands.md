# Command reference

| Command | What it does |
|---|---|
| `systemctl status NAME` | look at a service |
| `sudo systemctl start NAME` | run it now |
| `sudo systemctl stop NAME` | stop it now |
| `sudo systemctl restart NAME` | stop, then start |
| `systemctl is-active NAME` | running now? |
| `sudo systemctl enable NAME` | start at boot (does not start it now) |
| `sudo systemctl disable NAME` | do not start at boot |
| `systemctl is-enabled NAME` | starts at boot? |
| `sudo systemctl enable --now NAME` | enable and start |
| `sudo systemctl disable --now NAME` | disable and stop |
