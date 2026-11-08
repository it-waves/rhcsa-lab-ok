# Interrupt the boot process in order to gain access to a system

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The GRUB screens are real screenshots of a virtual machine, taken while a script pressed the keys (`e`, the arrow keys, `Ctrl+E`, the text, `Ctrl+X`). The root-shell session is the real text from the serial console. The only thing changed is that some boot lines are left out of the video.

## Exam objective (exact wording)
Interrupt the boot process in order to gain access to a system

## What the video covers
1. Boot stages: firmware, GRUB (boot menu), kernel and initramfs, real system. `rd.break` stops the boot inside the initramfs, just before the switch to the real root.
2. At the GRUB menu: press `e` on the entry, move to the `linux` line, press `Ctrl+E` (or End) to reach its end, type a space and `rd.break`, press `Ctrl+X`. The edit is for this one boot only.
3. The initramfs prints a warning (Break before switch_root) and asks you to press Enter for maintenance. Then you have a root shell without a password.
4. `mount -o remount,rw /sysroot` (the real root file system is mounted read-only under `/sysroot`), then `chroot /sysroot`.
5. `passwd root`, then `touch /.autorelabel` so the next boot fixes the SELinux labels, `ls -l /.autorelabel`, then `exit` twice.
6. After the (slower) relabel boot: `sudo passwd -S root` shows status P, `getenforce` shows Enforcing, `/.autorelabel` is gone, the system is running.

## Honest limits
- The cloud image used for the lab has the root account locked at the start, so status L changes to P. On your own machine the root password may already be set; the steps are the same.
- The lab menu had a longer countdown than the default, so a script could reliably catch it. The real default is 1 second on this image.
- Not covered: GRUB passwords, UEFI differences, `systemd.unit=emergency.target` and the rescue target (on this cloud image they ask for a root password, but root is locked, so they cannot be used without first doing the steps above), `enforcing=0`.
- The checker looks at the result: root has a password (status P, needs sudo), SELinux is Enforcing, `/.autorelabel` is gone, and the system finished booting. It cannot see how you got in.
- The practice task needs console access to a machine (a hypervisor console or a physical keyboard). Over ssh alone you cannot do it.

## Sources
- The man pages on your own system: `man dracut.cmdline` (rd.break), `man chroot`, `man passwd`, `man mount`, `man selinux`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`, `captures/` (GRUB screenshots and the console session text)

## Lab
Use the lab from V00 (user `student`, host `node1`).
