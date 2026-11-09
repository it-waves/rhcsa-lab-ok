# Command reference

| Command | What it does |
|---|---|
| `ls -Z /etc/passwd` | context of a file |
| `ls -dZ /var/log` | context of a directory itself (`-d`) |
| `ps -Z -C sshd` | context of the processes named sshd (`-C` = by command name) |
| `ps -Z` | context of your own processes |
| `id -Z` | your own context |

A context is `user:role:type:level`; the type is the third field.
