# Practice task: extend a logical volume

Work as `student`. The disks `/dev/vdb` and `/dev/vdc` must be blank.

**Setup (once).**

```
sudo parted -s /dev/vdb mklabel gpt
sudo parted -s /dev/vdb mkpart pv 1MiB 1GiB
sudo pvcreate /dev/vdb1
sudo vgcreate vgexam /dev/vdb1
sudo lvcreate -n lvexam -L 600M vgexam
sudo mkfs.xfs /dev/vgexam/lvexam
sudo mkdir /mnt/exam
sudo mount /dev/vgexam/lvexam /mnt/exam
echo 'exam ok' | sudo tee /mnt/exam/hello.txt
```

**Task.**

1. The group `vgexam` is too small. Add the blank disk `/dev/vdc` to it.
2. Extend the logical volume `lvexam` to 2G and grow its file system. Do not unmount it.
3. Keep the data in `hello.txt`.
4. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
