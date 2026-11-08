. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo journalctl --list-boots --no-pager'
run 'grep ^Storage /etc/systemd/journald.conf'
