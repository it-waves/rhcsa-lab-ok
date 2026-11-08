# Command reference

| Command | What it does |
|---|---|
| `ls -d /run/log/journal /var/log/journal` | which journal folders exist |
| `sudo journalctl --disk-usage` | space the journal uses |
| `sudo mkdir -p /etc/systemd/journald.conf.d` | create the drop-in folder |
| `printf 'TEXT\n' \| sudo tee FILE` | write text to a file as root |
| `sudo systemctl restart systemd-journald` | read the new setting |
| `sudo journalctl --flush` | move the in-memory journal to disk |
| `sudo journalctl --list-boots` | every boot the journal keeps |
