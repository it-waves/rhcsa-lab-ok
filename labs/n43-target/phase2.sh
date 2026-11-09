. /tmp/lab/lib.sh
step "After the reboot"
run 'systemctl get-default'
run 'systemctl is-active multi-user.target'
run 'systemctl is-active graphical.target'
