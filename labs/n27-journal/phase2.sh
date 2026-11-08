. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo journalctl --list-boots --no-pager'
run 'cat /etc/systemd/journald.conf.d/persistent.conf'
