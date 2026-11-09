# Solution

```
sudo semanage port -a -t http_port_t -p tcp 8899
sudo semanage port -l -C
bash check.sh
sudo systemctl reboot
```

After the reboot, `bash check.sh` again: PASS. The `semanage` change is permanent.

When you are done on your own system, remove it: `sudo semanage port -d -t http_port_t -p tcp 8899`.
