# Command reference

| Command | What it does |
|---|---|
| `sudo vgs` | list volume groups |
| `sudo vgcreate NAME DISK` | create a group from a physical volume |
| `sudo vgextend NAME DISK` | add a physical volume to a group |
| `sudo vgreduce NAME DISK` | take a physical volume out of a group |
| `sudo pvs` | list physical volumes (VG column = their group) |
