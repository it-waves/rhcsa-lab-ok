. /tmp/lab/lib.sh
step "After the reboot"
run 'systemctl is-enabled rpcbind'
run 'systemctl is-active rpcbind'
