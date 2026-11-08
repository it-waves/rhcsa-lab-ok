# List, create, and delete partitions on GPT disks

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

**Important lab note:** the lab VM has two extra blank 5 GB disks, `/dev/vdb` and `/dev/vdc`. The demo uses `/dev/vdb`; the practice task uses `/dev/vdc`. These commands destroy data on the disk you point them at. Never run them on a disk you care about.

## Exam objective (exact wording)
List, create, and delete partitions on GPT disks

## What the video covers
1. `lsblk` lists block devices. Disks are `disk`, partitions are `part`.
2. `sudo parted /dev/vdb print` on a blank disk says `unrecognised disk label`: there is no partition table yet.
3. `sudo parted -s /dev/vdb mklabel gpt` writes a GPT label (`-s` = script mode, no prompts).
4. `mkpart NAME START END` creates a partition: `mkpart data1 1MiB 1GiB`, then `mkpart data2 1GiB 2GiB`. Partitions appear as `/dev/vdb1`, `/dev/vdb2`.
5. `sudo fdisk -l /dev/vdb` is another view of the same table.
6. The table survives a reboot.
7. `sudo parted -s /dev/vdb rm 2` deletes partition 2.

## Honest limits
- Not covered: MBR disks, `gdisk`/`sgdisk`, resizing partitions, partition type flags, filesystems and mounting (later objectives).
- The checker looks at the result: `/dev/vdc` has a GPT label, `/dev/vdc1` is about 500 MiB, and there is no `/dev/vdc2`.

## Sources
- The man pages on your own system: `man parted`, `man lsblk`, `man fdisk`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`) with a spare blank disk.
