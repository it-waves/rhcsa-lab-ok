# Practice task: start, stop and enable services

Work as `student`.

**Setup (once).**

```
sudo dnf -y install httpd at
sudo systemctl enable --now atd
```

**Task.**

1. Make `httpd` run now and start automatically at every boot.
2. Stop the `atd` service and make sure it does not start at boot.
3. Run the checker (`bash check.sh`), reboot, and run it again.

The solution is in `solution.md`. Try first.
