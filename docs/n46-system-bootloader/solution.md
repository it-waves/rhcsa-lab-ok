# Solution

```
sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=7/' /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo grubby --update-kernel=ALL --args="loglevel=5"
bash check.sh
```

Or edit the file by hand with `sudo vim /etc/default/grub`. Without `grub2-mkconfig`, the machine keeps the old timeout.
