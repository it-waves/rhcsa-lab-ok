# Command reference

| Command | What it does |
|---|---|
| `sudo -l` | what may I run? |
| `sudo -l -U NAME` | what may NAME run? |
| `getent group wheel` | members of the group wheel (full sudo) |
| `sudo usermod -aG wheel NAME` | give NAME full sudo |
| `sudo visudo -f /etc/sudoers.d/NAME` | edit a sudo rule file, with a syntax check |
| `sudo chmod 0440 /etc/sudoers.d/NAME` | sudo files: read-only mode |
| `sudo visudo -c` | check the syntax of all sudo files |
| `NAME ALL=(ALL) NOPASSWD: /path/command` | rule: NAME may run one command without a password |
