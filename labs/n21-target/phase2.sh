. /tmp/lab/lib.sh
step "After the reboot"
run 'cat /proc/cmdline'
run 'systemctl get-default'
run 'systemctl is-active graphical.target'
step "Remove the argument again"
run 'sudo grubby --update-kernel=ALL --remove-args=systemd.unit=graphical.target'
run 'sudo grubby --info=DEFAULT'
