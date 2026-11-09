. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo setsebool -P httpd_can_network_connect on'
run 'bash /tmp/lab/check.sh'
