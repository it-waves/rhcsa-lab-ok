# Solution

```
sudo mkdir /mnt/exam
sudo vim /etc/fstab
```

Add this line, then save:

```
LABEL=examlabel /mnt/exam ext4 defaults 0 0
```

```
sudo systemctl daemon-reload
sudo mount -a
bash check.sh
```

`findmnt /mnt/exam` shows the mount. A `UUID=` line (from `sudo blkid`) works too.
