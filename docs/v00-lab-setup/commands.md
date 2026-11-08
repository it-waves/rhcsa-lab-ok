# V00 command reference
| Command | Purpose |
|---|---|
| `cat /etc/redhat-release` | which release this is |
| `nproc` / `free -h` | CPUs / memory |
| `/lib64/ld-linux-x86-64.so.2 --help \| grep supported` | CPU levels the system supports |
| `lsblk` | block devices |
| `getenforce` | SELinux mode |
| `systemctl is-active NAME...` | service state |
| `hostnamectl --static` / `hostnamectl set-hostname NAME` | read / set persistent hostname |
| `useradd -m -s /bin/bash NAME` | create a user |
| `id NAME` | show a user's IDs |
| `systemctl reboot` | reboot |
