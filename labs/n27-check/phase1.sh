. /tmp/lab/lib.sh
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "sudo sed -i 's/^#Storage=.*/Storage=persistent/' /etc/systemd/journald.conf"
run 'sudo systemctl restart systemd-journald'
run 'bash /tmp/lab/check.sh'
