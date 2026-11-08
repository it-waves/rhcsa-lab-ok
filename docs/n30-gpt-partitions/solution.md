# Solution

```
sudo parted -s /dev/vdc mklabel gpt
sudo parted -s /dev/vdc mkpart exam1 1MiB 501MiB
sudo parted -s /dev/vdc mkpart exam2 501MiB 1525MiB
sudo parted -s /dev/vdc rm 2
bash check.sh
```

`sudo parted /dev/vdc print` shows the table at any step. Start the first partition at 1MiB so it is aligned.
