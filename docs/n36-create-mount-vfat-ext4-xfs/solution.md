# Solution

```
sudo mkfs.xfs /dev/vdb1
sudo mkfs.vfat /dev/vdb2
sudo mount /dev/vdb1 /mnt/data1
sudo mount /dev/vdb2 /mnt/data2
echo exam | sudo tee /mnt/data1/ok.txt
sudo umount /mnt/data2
bash check.sh
```
