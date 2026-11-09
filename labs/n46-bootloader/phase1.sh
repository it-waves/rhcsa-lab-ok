. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. The bootloader settings"
run "grep -E '^GRUB_(TIMEOUT|CMDLINE_LINUX)' /etc/default/grub"
run 'sudo grubby --default-kernel'
step "2. Change the boot menu timeout"
run "sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=10/' /etc/default/grub"
run "grep '^GRUB_TIMEOUT' /etc/default/grub"
run 'sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
step "3. Add a kernel argument"
run 'sudo grubby --update-kernel=ALL --args="audit=1"'
run 'sudo grubby --info=DEFAULT'
