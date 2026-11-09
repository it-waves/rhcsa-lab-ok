# Command reference

| Command | What it does |
|---|---|
| `sudo passwd NAME` | set or change a password (type it twice) |
| `echo "PASSWORD" \| sudo passwd --stdin NAME` | set a password from a pipe (labs and scripts only) |
| `sudo passwd -S NAME` | password status: P = set, date, min, max, warn, inactive |
| `sudo chage -l NAME` | list the aging rules |
| `sudo chage -M DAYS NAME` | maximum days before the password expires |
| `sudo chage -m DAYS NAME` | minimum days between changes |
| `sudo chage -W DAYS NAME` | warning days before expiry |
| `sudo passwd -e NAME` | expire the password: must change at next login |
