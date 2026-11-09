# Command reference

| Command | What it does |
|---|---|
| `getenforce` | the running mode: Enforcing, Permissive or Disabled |
| `sestatus` | status, policy, current mode and mode from the config file |
| `grep '^SELINUX=' /etc/selinux/config` | the mode for the next boot |
| `sudo setenforce 0` | permissive, until the next reboot |
| `sudo setenforce 1` | enforcing, until the next reboot |
| `sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config` | permissive at boot |
| `sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config` | enforcing at boot |
