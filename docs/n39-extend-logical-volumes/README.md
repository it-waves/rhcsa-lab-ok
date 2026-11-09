# Extend existing logical volumes

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. Long `xfs_growfs` reports are shortened on screen and marked as shortened.

**Important lab note:** before the demo, the lab (not shown) turns the blank disk `/dev/vdb` into a physical volume, creates the volume group `vgdata` and a 1 GiB logical volume `lvapp` with an XFS file system, mounts it on `/mnt/app` (with a line in `/etc/fstab`) and writes `important.txt`. `/dev/vdc` is a second blank disk. These steps change the system.

## Exam objective (exact wording)
Extend existing logical volumes

## What the video covers
1. A logical volume lives in a volume group; the group needs free space (`sudo vgs`, column VFree).
2. `sudo lvextend -L +512M /dev/vgdata/lvapp` grows only the volume (the plus means add); `df -h` still shows the old size.
3. `sudo xfs_growfs /mnt/app` grows the XFS file system while mounted (for ext4: `resize2fs`).
4. `sudo lvextend -r -L +6G /dev/vgdata/lvapp` fails when the group is out of space (`Insufficient free space`).
5. `sudo pvcreate /dev/vdc`, `sudo vgextend vgdata /dev/vdc`, then the same `lvextend -r` works and grows the file system too.
6. After a reboot the size and the data are unchanged.

## Honest limits
- Not covered: shrinking (XFS cannot shrink), `-l +100%FREE`, thin volumes, partitioning the new disk first, LVM on RAID, snapshots.
- The checker uses `sudo lvs`; it reads sizes and does not change anything.
- Sizes are rounded by `df -h` and by LVM extents.

## Sources
- The man pages on your own system: `man lvextend`, `man vgextend`, `man pvcreate`, `man xfs_growfs`, `man df`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). The disks `/dev/vdb` and `/dev/vdc` must be blank.
