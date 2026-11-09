. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "0. The tool"
run 'rpm -q policycoreutils-python-utils || sudo dnf -y -q install policycoreutils-python-utils'
run 'command -v semanage'
step "1. The port labels"
run "sudo semanage port -l | grep '^http_port_t'"
run "sudo semanage port -l | grep -w 8080"
step "2. Add a port to a label"
run 'sudo semanage port -a -t http_port_t -p tcp 8888'
run "sudo semanage port -l | grep '^http_port_t'"
run 'sudo semanage port -l -C'
step "3. A port that already has a label"
run 'sudo semanage port -a -t http_port_t -p tcp 8080'
run 'sudo semanage port -m -t http_port_t -p tcp 8080'
run "sudo semanage port -l | grep '^http_port_t'"
step "4. Remove what we added"
run 'sudo semanage port -d -t http_port_t -p tcp 8888'
run 'sudo semanage port -d -t http_port_t -p tcp 8080'
run 'sudo semanage port -l -C'
run "sudo semanage port -l | grep -w 8080"
