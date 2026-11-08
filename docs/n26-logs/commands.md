# Command reference

| Command | What it does |
|---|---|
| `ls /var/log` | list the log folder |
| `sudo journalctl -u UNIT -n 3 --no-pager` | last 3 lines of one unit |
| `sudo journalctl -k` | kernel messages only |
| `sudo journalctl -p err -b` | errors of this boot |
| `sudo journalctl -b -1` | the previous boot |
| `sudo journalctl --list-boots` | every boot the journal keeps |
| `logger -t TAG "text"` | write a message with a tag |
| `sudo journalctl -t TAG` | messages with that tag |
| `sudo journalctl --since "5 minutes ago"` | limit by time |
| `sudo journalctl -b \| wc -l` | count the lines of this boot |
