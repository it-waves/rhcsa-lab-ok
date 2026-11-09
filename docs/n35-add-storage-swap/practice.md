# Practice task: add storage and swap

Work as `student`.

**Setup (once).** A group in use, with data in it:

```
sudo pvcreate /dev/vdb
sudo vgcreate vgexam /dev/vdb
sudo lvcreate -y -n examdata -L 1G vgexam
sudo mkfs.ext4 -q -L keep /dev/vgexam/examdata
sudo mkdir /mnt/keep
echo 'LABEL=keep /mnt/keep ext4 defaults 0 0' | sudo tee -a /etc/fstab
sudo systemctl daemon-reload
sudo mount -a
echo 'customer data' | sudo tee /mnt/keep/important.txt
```

`/dev/vdc` must be a blank disk.

**Task.** Do not damage the data in `/mnt/keep`.

1. On `/dev/vdc` create a GPT label and one partition of 512 MiB.
2. Make it swap, switch it on, and add it to `/etc/fstab` (by UUID).
3. Create a logical volume `examnew` of 200 MiB in `vgexam`.
4. Run the checker (`bash check.sh`), reboot, and run it again.

The solution is in `solution.md`. Try first.
