# V02 command reference

| Command | What it does |
|---|---|
| `whoami` / `id` | current user, and uid, gids, groups |
| `systemctl get-default` | the default boot target |
| `systemctl is-active multi-user.target` | is that target active |
| `su USER` | switch user, keep current directory and most of the environment |
| `su - USER` | switch with a login shell (the user's home and environment) |
| `su - USER -c "CMD"` | run one command as that user and return |
| `exit` | leave the switched shell and go back |
| `sudo -u USER CMD` | run one command as USER |
| `sudo -i` | root's login shell |
| `sudo whoami` | prints root |
| `ssh USER@HOST` | log in as USER on HOST |
| `ssh USER@HOST "CMD"` | log in, run CMD, return |
