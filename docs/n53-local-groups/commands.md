# Command reference

| Command | What it does |
|---|---|
| `getent group NAME` | show the group line (name:x:GID:members) |
| `sudo groupadd NAME` | create a group |
| `sudo groupadd -g 3000 NAME` | create a group with a chosen group ID |
| `sudo usermod -aG GROUP USER` | add a user to a group (keep other groups) |
| `id USER` | the groups of a user |
| `sudo groupmod -n NEWNAME OLDNAME` | rename a group |
| `sudo gpasswd -d USER GROUP` | remove a user from a group |
| `sudo groupdel NAME` | delete a group |
