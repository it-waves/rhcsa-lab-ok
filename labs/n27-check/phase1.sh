. /tmp/lab/lib.sh
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo mkdir -p /etc/systemd/journald.conf.d'
run "printf '[Journal]\\nStorage=persistent\\n' | sudo tee /etc/systemd/journald.conf.d/persistent.conf"
run 'sudo systemctl restart systemd-journald'
run 'bash /tmp/lab/check.sh'
