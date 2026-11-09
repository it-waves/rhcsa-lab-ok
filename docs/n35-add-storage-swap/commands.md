# Command reference

| Command | What it does |
|---|---|
| `lsblk DISK` | look before you change anything |
| `sudo parted -s DISK mklabel gpt` | new GPT label (erases the table: empty disks only) |
| `sudo parted -s DISK mkpart NAME START END` | new partition |
| `sudo pvcreate PART` / `sudo vgextend GROUP PART` | partition to physical volume, add to a group |
| `sudo lvcreate -n NAME -L SIZE GROUP` | new logical volume |
| `sudo mkswap PART` | prepare swap space |
| `sudo swapon PART` | switch swap on now |
| `swapon --show` | list active swap |
| `UUID=... none swap defaults 0 0` | the fstab line for swap |
