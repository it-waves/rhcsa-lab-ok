# Practice task: modify the bootloader

Work as `student`, in a virtual machine (a wrong bootloader change can stop a machine from booting).

**Task.**

1. Set the GRUB menu timeout to 7 seconds in `/etc/default/grub`.
2. Regenerate the GRUB configuration file.
3. Add the kernel argument `loglevel=5` to all installed kernels.
4. Run the checker (`bash check.sh`), reboot, and run it again.

The solution is in `solution.md`. Try first.
