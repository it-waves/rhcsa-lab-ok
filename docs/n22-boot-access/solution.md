# Solution

At the GRUB menu: `e`, go to the `linux` line, `Ctrl+E`, type ` rd.break`, `Ctrl+X`. Press Enter at "Press Enter for maintenance".

In the root shell:

```
mount -o remount,rw /sysroot
chroot /sysroot
passwd root
touch /.autorelabel
exit
exit
```

The machine relabels the file system (slower boot), then starts normally. Log in and run:

```
bash check.sh
```
