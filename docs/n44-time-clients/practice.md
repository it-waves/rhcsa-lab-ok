# Practice task: a time client

Work as `student`.

**Setup (once).**

```
sudo dnf -y install chrony
sudo systemctl disable --now chronyd
```

**Task.**

1. Add the line `server ntp.lab.example iburst` to `/etc/chrony.conf`.
2. Make `chronyd` start at boot and run now.
3. Run the checker (`bash check.sh`), reboot, and run it again.

The server name does not exist, so nothing will synchronize. The checker only looks at the line and the service. The solution is in `solution.md`. Try first.
