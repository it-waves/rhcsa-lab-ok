. /tmp/lab/lib.sh
step "After the reboot"
run 'crontab -l'
run 'systemctl is-enabled hello.timer'
run 'systemctl list-timers hello.timer --no-pager'
