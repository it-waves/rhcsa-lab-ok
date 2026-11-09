# Solution

```
sudo systemctl set-default multi-user.target
bash check.sh
```

`set-default` only moves the `/etc/systemd/system/default.target` link; it does not switch the running system. After the reboot the checker still passes.
