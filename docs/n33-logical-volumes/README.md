# Create and delete logical volumes

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** before the demo, the lab (not shown) prepares the two blank 5 GB disks as physical volumes and creates the volume group `vgdata` from them, as in the previous two videos (`sudo pvcreate /dev/vdb /dev/vdc`, `sudo vgcreate vgdata /dev/vdb /dev/vdc`). These commands change the disks and groups you point them at.

## Exam objective (exact wording)
Create and delete logical volumes

## What the video covers
1. A logical volume is a named slice of a volume group.
2. `sudo vgs` shows the group with free space; `sudo lvs` lists logical volumes (none yet).
3. `sudo lvcreate -n lvdata -L 1G vgdata`: `-n` name, `-L` size (capital L), last the volume group. `lvs` shows it (the Attr letter `a` means active).
4. `sudo lvcreate -n lvlogs -L 500M vgdata` makes a second one (`M` megabytes, `G` gigabytes).
5. Device files appear as `/dev/vgdata/lvdata`, links to `/dev/dm-0` and so on. `vgs` shows 2 LV and the remaining free space.
6. The volumes survive a reboot.
7. `sudo lvremove -y vgdata/lvlogs` deletes one (`-y` answers yes to the confirmation). Its data is gone; the space returns to the group.

## Honest limits
- Not covered: file systems on the volumes and mounting (later videos), extending (`lvextend`), `-l` with extents or percentages, `lvrename`, snapshots, thin volumes.
- The checker looks at the result: `examvg/examlv` is about 300 MiB, and `examvg/oldlv` is gone.

## Sources
- The man pages on your own system: `man lvcreate`, `man lvremove`, `man lvs`, `man lvm`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with two spare blank disks.
