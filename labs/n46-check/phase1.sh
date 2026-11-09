. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=7/' /etc/default/grub"
run 'sudo grub2-mkconfig -o /boot/grub2/grub.cfg'
run 'sudo grubby --update-kernel=ALL --args="loglevel=5"'
run 'bash /tmp/lab/check.sh'
