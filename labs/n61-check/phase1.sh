. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Setup"
run 'rpm -q policycoreutils-python-utils || sudo dnf -y -q install policycoreutils-python-utils'
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo semanage port -a -t http_port_t -p tcp 8899'
run 'bash /tmp/lab/check.sh'
