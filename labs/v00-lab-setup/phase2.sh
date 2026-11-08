. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'hostnamectl --static'
run 'id labuser'
run 'getenforce'
