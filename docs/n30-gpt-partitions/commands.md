# Command reference

| Command | What it does |
|---|---|
| `lsblk` | list block devices |
| `sudo parted DISK print` | show the partition table |
| `sudo parted -s DISK mklabel gpt` | write a GPT label (erases the table) |
| `sudo parted -s DISK mkpart NAME START END` | create a partition |
| `sudo parted -s DISK rm N` | delete partition N |
| `sudo fdisk -l DISK` | list the table, fdisk style |
