. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo systemctl set-default graphical.target >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo systemctl set-default multi-user.target'
run 'bash /tmp/lab/check.sh'
