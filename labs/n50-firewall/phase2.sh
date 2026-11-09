. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo firewall-cmd --list-services'
run 'sudo firewall-cmd --list-ports'
