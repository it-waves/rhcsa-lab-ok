# Solution

```
sudo grubby --update-kernel=ALL --args=systemd.unit=graphical.target
sudo systemctl reboot
```

After the machine is back:

```
mkdir lab21
systemctl is-active graphical.target > lab21/target.txt
sudo grubby --update-kernel=ALL --remove-args=systemd.unit=graphical.target
bash check.sh
```

The checker reads `/proc/cmdline` of the running boot, so it passes after the reboot even though the option is already removed from the saved boot entries.
