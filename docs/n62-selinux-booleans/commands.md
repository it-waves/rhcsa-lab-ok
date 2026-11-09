# Command reference

| Command | What it does |
|---|---|
| `getsebool NAME` | read one boolean |
| `getsebool -a` | list all booleans |
| `sudo semanage boolean -l` | list with description and (current , default) |
| `sudo semanage boolean -l -C` | list only the booleans changed from the default |
| `sudo setsebool NAME on` | change until the next reboot |
| `sudo setsebool -P NAME on` | change permanently (saved) |
