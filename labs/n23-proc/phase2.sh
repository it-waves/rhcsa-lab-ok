. /tmp/lab/lib.sh
step "After the reboot"
run 'pgrep -x sleep'
run 'uptime -p'
