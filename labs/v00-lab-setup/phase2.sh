. /tmp/lab/lib.sh
step "Check after reboot (configuration must persist)"
run 'uptime -p'
run 'hostnamectl --static'
run 'id labuser'
run 'getenforce'
run 'systemctl is-active chronyd sshd'
