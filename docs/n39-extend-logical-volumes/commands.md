# Command reference

| Command | What it does |
|---|---|
| `sudo vgs` | list volume groups; VFree is the free space |
| `sudo lvs` | list logical volumes |
| `df -h FOLDER` | size of the file system, human-readable |
| `sudo lvextend -L +512M /dev/VG/LV` | add 512 MiB to the volume only |
| `sudo xfs_growfs MOUNTPOINT` | grow a mounted XFS file system |
| `sudo resize2fs /dev/VG/LV` | grow an ext4 file system |
| `sudo lvextend -r -L +6G /dev/VG/LV` | add 6 GiB to the volume and grow the file system |
| `sudo pvcreate /dev/DISK` | mark a disk as a physical volume |
| `sudo vgextend VG /dev/DISK` | add a physical volume to a group |
