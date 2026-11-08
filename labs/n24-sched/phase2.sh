. /tmp/lab/lib.sh
step "After the reboot"
run 'ps -C sleep -o pid,ni,comm'
run 'pgrep -x sleep'
