. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf install -y -q firewalld >/dev/null 2>&1
sudo systemctl enable --now firewalld >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo firewall-cmd --permanent --add-service=https'
run 'sudo firewall-cmd --permanent --add-port=5000/tcp'
run 'sudo firewall-cmd --permanent --remove-service=dhcpv6-client'
run 'sudo firewall-cmd --reload'
run 'bash /tmp/lab/check.sh'
