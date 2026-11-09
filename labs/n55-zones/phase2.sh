. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo firewall-cmd --get-default-zone'
run 'sudo firewall-cmd --zone=public --list-services'
run 'sudo firewall-cmd --zone=public --list-ports'
