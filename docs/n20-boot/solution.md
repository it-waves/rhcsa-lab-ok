# Solution

```
sudo shutdown -h +20
sudo shutdown -c
sudo systemctl reboot
```

After the machine is back:

```
mkdir lab20
who -b > lab20/boot.txt
bash check.sh
```

The checker compares `boot.txt` with the current `who -b`, so the file must be written after the reboot.
