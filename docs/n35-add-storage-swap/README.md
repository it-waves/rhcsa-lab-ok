# Add new partitions and logical volumes, and swap to a system non-destructively

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** before the demo, the lab (not shown) creates a volume group `vgdata` on `/dev/vdb`, a 1 GB logical volume `lvapp` with an ext4 file system mounted on `/mnt/app` (with a line in `/etc/fstab`), and a file `important.txt` containing `customer data`. `/dev/vdc` is blank. `mklabel gpt` erases a partition table: run it only on an empty disk. These commands change disks, groups and `/etc/fstab`.

## Exam objective (exact wording)
Add new partitions and logical volumes, and swap to a system non-destructively

## What the video covers
1. Non-destructive: only use free space or a new blank disk. Check with `lsblk` and `sudo vgs` before every step.
2. New partitions on the blank disk: `sudo parted -s /dev/vdc mklabel gpt`, `mkpart pv 1MiB 2GiB`, `mkpart swap 2GiB 2560MiB`, `lsblk /dev/vdc`.
3. Grow the group: `sudo pvcreate /dev/vdc1`, `sudo vgextend vgdata /dev/vdc1`, `sudo vgs`.
4. New logical volume: `sudo lvcreate -n lvnew -L 1G vgdata`, `sudo lvs` (the `o` in Attr means open, i.e. in use).
5. Swap: `sudo mkswap /dev/vdc2`, `sudo swapon /dev/vdc2`, `swapon --show`, then the fstab line `UUID=<from mkswap or blkid> none swap defaults 0 0`.
6. After a reboot: swap is active, the new volume exists, and the old file still reads `customer data`.

## Honest limits
- Not covered: formatting and mounting the new volume (next video), swap files (`dd`/`fallocate`), swap priority, `partprobe` on disks in use, resizing or adding partitions next to existing ones on a used disk, swap on logical volumes.
- The checker looks at the result: `/dev/vdc1` is active swap and in `/etc/fstab`, `vgexam/examnew` exists, and `/mnt/keep/important.txt` still reads `customer data`.

## Sources
- The man pages on your own system: `man parted`, `man mkswap`, `man swapon`, `man lvcreate`, `man vgextend`, `man fstab`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with two spare blank disks.
