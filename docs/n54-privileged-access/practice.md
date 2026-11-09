# Practice task: configure privileged access

Work as `student`, in a virtual machine. First prepare (one command per line):

```
sudo useradd gina
sudo useradd hank
```

**Task.**

1. Give `gina` full sudo by putting her in the group `wheel`.
2. Let `hank` run `/usr/bin/systemctl` without a password, in the file `/etc/sudoers.d/hank`, with mode `0440`.
3. Check the syntax with `sudo visudo -c`.
4. Run the checker (`bash check.sh`), reboot, and run it again.

The solution is in `solution.md`. Try first.
