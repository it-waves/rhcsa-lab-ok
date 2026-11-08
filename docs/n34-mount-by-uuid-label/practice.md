# Practice task: mount by label

Work as `student`.

**Setup (once).** Create a volume with a label:

```
sudo pvcreate /dev/vdb /dev/vdc
sudo vgcreate vgexam /dev/vdb /dev/vdc
sudo lvcreate -y -n lvexam -L 300M vgexam
sudo mkfs.ext4 -q -L examlabel /dev/vgexam/lvexam
```

**Task.**

1. Create the folder `/mnt/exam`.
2. Add a line to `/etc/fstab` that mounts the volume labelled `examlabel` on `/mnt/exam` (type ext4, options `defaults`).
3. Mount it with `sudo mount -a` and make sure there is no error.
4. Run the checker (`bash check.sh`), reboot, and run it again.

The solution is in `solution.md`. Try first.
