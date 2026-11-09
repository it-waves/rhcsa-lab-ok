# Practice task: configure firewall settings

Work as `student`, in a virtual machine. First prepare (one command per line):

```
sudo dnf install -y firewalld
sudo systemctl enable --now firewalld
```

**Task.**

1. In the zone `public`, add the port `9090/tcp` and the service `https`, at runtime (no `--permanent`).
2. Save both with `--runtime-to-permanent`.
3. Set the default zone to `dmz`.
4. Run the checker (`bash check.sh`), reboot, and run it again.

Order matters: if you add a rule with `--permanent` first and then run `--runtime-to-permanent`, the running rules replace the saved ones and your permanent rule is lost.

The solution is in `solution.md`. Try first.
