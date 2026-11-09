# Command reference

| Command | What it does |
|---|---|
| `systemctl get-default` | print the default target |
| `sudo systemctl set-default NAME.target` | boot into this target from now on |
| `ls -l /etc/systemd/system/default.target` | show where the default link points |
| `systemctl is-active NAME.target` | is this target reached? |
