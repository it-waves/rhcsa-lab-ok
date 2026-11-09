# Command reference

| Command | What it does |
|---|---|
| `grep -E '^GRUB_(TIMEOUT\|CMDLINE_LINUX)' /etc/default/grub` | show timeout and kernel arguments |
| `sudo grubby --default-kernel` | kernel that starts by default |
| `sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=10/' /etc/default/grub` | change the timeout |
| `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` | regenerate the real configuration |
| `sudo grubby --update-kernel=ALL --args="NAME=VALUE"` | add a kernel argument to all kernels |
| `sudo grubby --update-kernel=ALL --remove-args="NAME"` | remove a kernel argument |
| `sudo grubby --info=DEFAULT` | show the default boot entry |
| `cat /proc/cmdline` | arguments the running kernel received |
