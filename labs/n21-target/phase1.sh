. /tmp/lab/lib.sh
step "1. Targets and the default"
run 'systemctl get-default'
run 'systemctl is-active multi-user.target'
run 'systemctl is-active graphical.target'
step "2. The kernel command line"
run 'cat /proc/cmdline'
step "3. Add a boot argument"
run 'sudo grubby --update-kernel=ALL --args=systemd.unit=graphical.target'
run 'sudo grubby --info=DEFAULT'
