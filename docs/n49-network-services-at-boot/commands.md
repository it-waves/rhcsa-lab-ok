# Command reference

| Command | What it does |
|---|---|
| `systemctl is-enabled NAME` | will it start at boot? |
| `systemctl is-active NAME` | is it running now? |
| `ss -tln \| grep ':PORT '` | is something listening on that TCP port? |
| `sudo systemctl enable --now NAME` | start at boot and start now |
| `sudo systemctl disable --now NAME` | do not start at boot, and stop now |
