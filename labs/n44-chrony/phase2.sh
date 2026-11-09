. /tmp/lab/lib.sh
step "After the reboot"
run 'systemctl is-enabled chronyd'
run 'systemctl is-active chronyd'
run 'chronyc sources'
