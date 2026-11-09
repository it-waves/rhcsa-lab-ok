# Practice task: file systems

Work as `student`. `/dev/vdb` must be a blank disk you can lose.

**Setup (once).** Install the VFAT tools if needed, make two partitions and two folders:

```
sudo dnf -y install dosfstools
sudo parted -s /dev/vdb mklabel gpt
sudo parted -s /dev/vdb mkpart a 1MiB 301MiB
sudo parted -s /dev/vdb mkpart b 301MiB 601MiB
sudo mkdir /mnt/data1
sudo mkdir /mnt/data2
```

**Task.**

1. Make an XFS file system on `/dev/vdb1` and a VFAT file system on `/dev/vdb2`.
2. Mount `/dev/vdb1` on `/mnt/data1` and `/dev/vdb2` on `/mnt/data2`.
3. Write a file `ok.txt` containing `exam` in `/mnt/data1`.
4. Unmount `/mnt/data2`.
5. Run the checker (`bash check.sh`), reboot, and look at `lsblk -f /dev/vdb`.

The solution is in `solution.md`. Try first.
