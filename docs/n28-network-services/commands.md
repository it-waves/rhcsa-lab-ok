# Command reference

| Command | What it does |
|---|---|
| `ss -tln` | listening TCP ports, as numbers |
| `sudo ss -tlnp` | the same, with the owning program |
| `systemctl status NAME --no-pager` | full status report |
| `systemctl is-active NAME` | running now? |
| `systemctl is-enabled NAME` | starts at boot? |
| `sudo systemctl stop NAME` | stop now |
| `sudo systemctl start NAME` | start now |
| `sudo systemctl restart NAME` | stop and start |
| `sudo systemctl disable NAME` | do not start at boot (keeps running) |
| `sudo systemctl enable --now NAME` | start at boot and start now |
| `sudo systemctl disable --now NAME` | do not start at boot and stop now |
