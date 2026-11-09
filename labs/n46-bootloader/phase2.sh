. /tmp/lab/lib.sh
step "After the reboot"
run 'cat /proc/cmdline'
run "grep '^set timeout=' /boot/grub2/grub.cfg"
