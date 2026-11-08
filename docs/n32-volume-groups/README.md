# Assign physical volumes to volume groups

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** the lab VM has two extra blank 5 GB disks, `/dev/vdb` and `/dev/vdc`. Before the demo, the lab (not shown) makes both of them physical volumes, as in the previous video (`sudo pvcreate /dev/vdb /dev/vdc`). These commands change the disks you point them at. Never run them on a disk you care about.

## Exam objective (exact wording)
Assign physical volumes to volume groups

## What the video covers
1. A volume group pools the space of one or more physical volumes. Logical volumes are cut from it later.
2. `sudo pvs` shows an empty VG column: no group yet. `sudo vgs` lists volume groups (nothing yet).
3. `sudo vgcreate vgdata /dev/vdb` creates the group `vgdata` from one physical volume. `vgs` shows 1 PV, 0 LV, about 5 GB free.
4. `sudo vgextend vgdata /dev/vdc` adds a second physical volume. `vgs` shows 2 PV and about 10 GB.
5. The group survives a reboot.
6. `sudo vgreduce vgdata /dev/vdc` takes a physical volume out again (only while it holds no data of the group).

## Honest limits
- Not covered: logical volumes (next video), `vgremove`, `vgrename`, `pvmove` (emptying a disk before `vgreduce`), and the extent size option `-s`.
- The checker looks at the result: a group `examvg` exists and has 2 physical volumes.

## Sources
- The man pages on your own system: `man vgcreate`, `man vgextend`, `man vgreduce`, `man vgs`, `man lvm`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with two spare blank disks.
