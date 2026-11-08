. /tmp/lab/lib.sh
step "Before the reboot"
run 'sudo grubby --update-kernel=ALL --args=systemd.unit=graphical.target'
