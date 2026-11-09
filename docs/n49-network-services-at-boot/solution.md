# Solution

```
sudo systemctl enable --now nfs-server
sudo systemctl disable --now cockpit.socket
systemctl is-enabled nfs-server
systemctl is-active nfs-server
systemctl is-enabled cockpit.socket
bash check.sh
```

Clean up: `sudo systemctl disable --now nfs-server` and `sudo systemctl enable --now cockpit.socket`
