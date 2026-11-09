. /tmp/lab/lib.sh
step "After the reboot"
run 'systemctl is-enabled httpd'
run 'systemctl is-active httpd'
