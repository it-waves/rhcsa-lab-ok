# Command reference

| Command | What it does |
|---|---|
| `sudo lvs` | list logical volumes |
| `sudo lvcreate -n NAME -L SIZE GROUP` | create a logical volume |
| `sudo lvremove -y GROUP/NAME` | delete a logical volume (`-y` = yes) |
| `ls -l /dev/GROUP` | the device files of a group's volumes |
| `sudo vgs` | the group's free space (VFree) |
