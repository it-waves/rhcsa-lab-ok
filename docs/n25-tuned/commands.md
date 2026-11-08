# Command reference

| Command | What it does |
|---|---|
| `rpm -q tuned` | is the package installed? |
| `sudo dnf install -y tuned` | install tuned |
| `sudo systemctl enable --now tuned` | start tuned now and at boot |
| `systemctl is-active tuned` | is the service running? |
| `tuned-adm active` | show the active profile |
| `tuned-adm recommend` | profile tuned suggests for this machine |
| `tuned-adm list` | list all profiles |
| `sudo tuned-adm profile NAME` | switch to profile NAME |
| `cat /etc/tuned/active_profile` | the saved choice |
