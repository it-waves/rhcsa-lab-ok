# Command reference

| Command | What it does |
|---|---|
| `lsblk DISK` / `lsblk -f DISK` | list partitions / also show the file system |
| `sudo mkfs.vfat PART` | make a VFAT file system |
| `sudo mkfs.ext4 PART` | make an ext4 file system |
| `sudo mkfs.xfs PART` | make an XFS file system |
| `sudo mkdir FOLDER` | make an empty folder to mount on |
| `sudo mount DEVICE FOLDER` | mount a file system |
| `df -hT FOLDER` | size and file system type |
| `findmnt FOLDER` | how it is mounted (no output = not mounted) |
| `sudo umount FOLDER` | unmount (no N after the U) |
