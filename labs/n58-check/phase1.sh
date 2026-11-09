. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo setenforce 0'
run "sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config"
run 'bash /tmp/lab/check.sh'
