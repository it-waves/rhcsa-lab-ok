. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Setup"
run 'bash /tmp/lab/setup.sh'
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo restorecon -v /etc/practice.conf'
run 'bash /tmp/lab/check.sh'
