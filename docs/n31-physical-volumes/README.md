# Create and remove physical volumes

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** the lab VM has two extra blank 5 GB disks, `/dev/vdb` and `/dev/vdc`. The demo uses `/dev/vdb`; the practice task uses `/dev/vdc`. These commands change the disk you point them at. Never run them on a disk you care about.

## Exam objective (exact wording)
Create and remove physical volumes

## What the video covers
1. LVM has three layers: physical volumes (disks LVM may use), volume groups (pooled space), logical volumes (what you format and mount). This video is the bottom layer only.
2. `sudo pvs` lists physical volumes; no output means none yet.
3. `sudo pvcreate /dev/vdb` turns a disk into a physical volume. `pvs` then shows it with an empty VG column and all of its size free.
4. `sudo pvdisplay /dev/vdb` shows the details: size, UUID, `Allocatable NO`, zero extents (no volume group uses it yet).
5. The label survives a reboot.
6. `sudo pvremove /dev/vdb` wipes the LVM label. It only works while no volume group uses the physical volume.

## Honest limits
- Not covered: volume groups and logical volumes (next videos), partitions as physical volumes, `pvmove`, `pvresize`, and the LVM devices file.
- The checker looks at the result: `/dev/vdc` is a physical volume and `/dev/vdb` is not. The lab (not shown) makes `/dev/vdb` a physical volume before the task.

## Sources
- The man pages on your own system: `man pvcreate`, `man pvs`, `man pvdisplay`, `man pvremove`, `man lvm`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with spare blank disks.
