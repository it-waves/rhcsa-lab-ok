# Create, mount, unmount, and use VFAT, ext4, and XFS file systems

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. The long `mkfs.ext4` and `mkfs.xfs` output is shortened on screen (marked with `...`).

**Important lab note:** before the demo, the lab (not shown) installs the `dosfstools` package (it provides `mkfs.vfat`) if it is missing. `/dev/vdb` is a blank disk. These commands erase and create partitions and file systems: run them only on a disk you can lose.

## Exam objective (exact wording)
Create, mount, unmount, and use VFAT, ext4, and XFS file systems

## What the video covers
1. A new partition has no file system until you make one. Cycle: `mkfs`, `mount`, use, `umount`.
2. Three partitions of 300 MiB: `sudo parted -s /dev/vdb mklabel gpt`, then `mkpart fat 1MiB 301MiB`, `mkpart ext 301MiB 601MiB`, `mkpart xfs 601MiB 901MiB`.
3. `sudo mkfs.vfat /dev/vdb1`, `sudo mkfs.ext4 /dev/vdb2`, `sudo mkfs.xfs /dev/vdb3`, then `lsblk -f /dev/vdb` (on this small partition `mkfs.vfat` chose FAT16).
4. `sudo mkdir /mnt/fat /mnt/ext /mnt/xfs` (run one per line in the video), `sudo mount DEVICE FOLDER`, `df -hT` for type and size.
5. Use: write a file on the ext4 file system, `ls`, `findmnt /mnt/xfs`.
6. `sudo umount FOLDER` (no N after the U). `findmnt` prints nothing when it is not mounted.
7. After a reboot: the file systems and UUIDs are still there; mounts made by hand are gone.

## Honest limits
- Not covered: mounting at boot (V34 covers `/etc/fstab`), labels with `-L`/`-n`, `mkfs.vfat -F 32`, mount options, `xfs_growfs`/`resize2fs`, repairing file systems, VFAT having no Linux permissions in practice.
- The checker looks at the result: `/dev/vdb1` is XFS, `/dev/vdb2` is VFAT, `/mnt/data1` is mounted and holds `ok.txt`, `/mnt/data2` is not mounted.

## Sources
- The man pages on your own system: `man mkfs`, `man mkfs.xfs`, `man mkfs.ext4`, `man mkfs.vfat`, `man mount`, `man umount`, `man findmnt`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with a spare blank disk.
