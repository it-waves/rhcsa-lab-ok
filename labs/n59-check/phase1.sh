. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'echo shadow_t > ~/context.txt'
run 'echo sshd_t >> ~/context.txt'
run 'cat ~/context.txt'
run 'bash /tmp/lab/check.sh'
