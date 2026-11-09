# Solution

```
sudo parted -s /dev/vdc mklabel gpt
sudo parted -s /dev/vdc mkpart swap 1MiB 513MiB
sudo mkswap /dev/vdc1
sudo swapon /dev/vdc1
sudo blkid /dev/vdc1
sudo vim /etc/fstab
```

Add this line (use the UUID printed by `blkid`), then save:

```
UUID=<the uuid> none swap defaults 0 0
```

```
sudo lvcreate -n examnew -L 200M vgexam
bash check.sh
```
