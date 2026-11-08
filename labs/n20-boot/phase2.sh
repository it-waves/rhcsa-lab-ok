. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'who -b'
run 'systemctl is-system-running --wait'
