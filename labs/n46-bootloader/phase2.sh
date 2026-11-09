. /tmp/lab/lib.sh
step "After the reboot"
run 'cat /proc/cmdline'
run "sudo grep -n 'timeout' /boot/grub2/grub.cfg"
run "sudo grep -rn 'timeout' /boot/efi/EFI/rocky/grub.cfg"
