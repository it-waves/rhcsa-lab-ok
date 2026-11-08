# Command reference

| Command or key | What it does |
|---|---|
| GRUB menu: `e` | edit the highlighted boot entry |
| `Ctrl+E` (or End) | jump to the end of the line in the GRUB editor |
| `rd.break` | kernel option: stop the boot in the initramfs, before the switch to the real root |
| `Ctrl+X` | boot with the edited entry (one time only) |
| `mount -o remount,rw /sysroot` | make the mounted real root file system read-write |
| `chroot /sysroot` | make `/sysroot` the root of the shell |
| `passwd root` | set the password of root |
| `touch /.autorelabel` | ask the next boot to relabel all files for SELinux |
| `ls -l /.autorelabel` | show the flag file |
| `exit` | leave the chroot, then leave the shell (boot continues) |
| `sudo passwd -S root` | password status: P = usable password, L = locked |
| `getenforce` | SELinux mode |
