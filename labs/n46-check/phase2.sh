. /tmp/lab/lib.sh
step "Check after the reboot"
run 'bash /tmp/lab/check.sh'
run "sudo grep -n 'timeout' /boot/grub2/grub.cfg"
run 'sudo ls -l /boot/grub2/grub.cfg /boot/efi/EFI/rocky/'
