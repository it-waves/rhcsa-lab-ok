# Command reference

| Command | What it does |
|---|---|
| `getent passwd NAME` | show the user line (name:x:UID:GID:comment:home:shell) |
| `id NAME` | user ID and group ID |
| `sudo useradd NAME` | create a user |
| `sudo useradd -u 1500 -c "Bob Lee" -s /bin/bash bob` | create with a user ID, comment and shell |
| `sudo usermod -s /usr/sbin/nologin NAME` | change the shell (no login) |
| `sudo usermod -c "Full Name" NAME` | change the comment |
| `sudo userdel NAME` | delete the user, keep the home directory |
| `sudo userdel -r NAME` | delete the user and the home directory |
