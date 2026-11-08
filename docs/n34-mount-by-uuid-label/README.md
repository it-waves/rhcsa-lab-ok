# Configure systems to mount file systems at boot by universally unique ID (UUID) or label

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** before the demo, the lab (not shown) creates a volume group `vgdata` from the two blank 5 GB lab disks, two 500 MB logical volumes, and puts an ext4 file system on each (one with the label `appdata`, one without a label). Creating file systems is a later objective. For the scripted capture, the fstab lines are appended with `echo ... | sudo tee -a /etc/fstab`; on the exam you may use `vim /etc/fstab` instead. These commands change `/etc/fstab` and the disks.

## Exam objective (exact wording)
Configure systems to mount file systems at boot by universally unique ID (UUID) or label

## What the video covers
1. `/etc/fstab` lists what to mount at boot. A device name such as `/dev/vdb` can change between boots; a label or a UUID belongs to the file system.
2. `sudo blkid DEVICE` shows `LABEL`, `UUID` and `TYPE`. The second volume has no label, so it is mounted by UUID.
3. By label: `sudo mkdir /mnt/app`, then the line `LABEL=appdata /mnt/app ext4 defaults 0 0` appended to `/etc/fstab`, `sudo systemctl daemon-reload`, `sudo mount -a`, `findmnt /mnt/app`.
4. By UUID: the same with `UUID=<number from blkid> /mnt/data ext4 defaults 0 0`.
5. The six fstab fields: device, folder, type, options, and two numbers for the old dump and fsck tools.
6. Test with `sudo mount -a` before rebooting: a wrong line can stop the boot.
7. After a reboot both folders are mounted without any mount command.

## Honest limits
- Not covered: creating file systems (`mkfs`), setting labels afterwards (`e2label`, `xfs_admin`), mount options such as `nofail`, `findmnt --verify`, NFS lines, swap lines.
- The checker looks at the result: `/etc/fstab` has a `LABEL=examlabel` or `UUID=` line for `/mnt/exam`, and `/mnt/exam` is mounted.

## Sources
- The man pages on your own system: `man fstab`, `man blkid`, `man findmnt`, `man mount`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with two spare blank disks.
