# Command reference

| Command | What it does |
|---|---|
| `systemctl get-default` | the target used at a normal boot |
| `systemctl is-active TARGET` | active or inactive (inactive = exit status 3) |
| `cat /proc/cmdline` | options the current boot started with |
| `sudo grubby --update-kernel=ALL --args=OPTION` | add a kernel option to the saved boot entries (permanent) |
| `sudo grubby --update-kernel=ALL --remove-args=OPTION` | remove it again |
| `sudo grubby --info=DEFAULT` | show the default boot entry, including its args |
| `systemd.unit=rescue.target` | kernel option: boot into the rescue target |
| GRUB menu: `e`, edit the `linux` line, `Ctrl+X` | boot once with the edited line |
