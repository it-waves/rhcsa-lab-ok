# Command reference

| Command | What it does |
|---|---|
| `sudo blkid DEVICE` | show LABEL, UUID and TYPE |
| `sudo mkdir FOLDER` | make the mount point |
| `echo 'LINE' \| sudo tee -a /etc/fstab` | append a line to fstab |
| `sudo systemctl daemon-reload` | make systemd re-read fstab |
| `sudo mount -a` | mount everything in fstab (test for errors) |
| `findmnt FOLDER` | show what is mounted there |
| `tail -n 2 /etc/fstab` | show the last two lines of fstab |
