# Command reference

| Command or file | What it does |
|---|---|
| `/etc/auto.master.d/NAME.autofs` | master map: `FOLDER  MAPFILE  OPTIONS` |
| `/etc/auto.NAME` | map file: `NAME  -fstype=nfs4,rw  SERVER:/path` |
| `--timeout=10` | unmount after 10 seconds idle |
| `echo "TEXT" \| sudo tee FILE` | write a line into a root-owned file and show it |
| `sudo systemctl enable --now autofs` | start autofs now and at every boot |
| `findmnt FOLDER` | how it is mounted (no output = not mounted) |
| `sleep 20` | wait 20 seconds |
