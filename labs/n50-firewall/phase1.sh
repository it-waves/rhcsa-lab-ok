. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf install -y -q firewalld >/dev/null 2>&1
step "1. Is the firewall running?"
run 'systemctl is-active firewalld'
run 'sudo systemctl enable --now firewalld'
run 'sudo firewall-cmd --state'
step "2. What is allowed now?"
run 'sudo firewall-cmd --list-services'
step "3. Allow a service, permanently"
run 'sudo firewall-cmd --permanent --add-service=http'
run 'sudo firewall-cmd --list-services'
run 'sudo firewall-cmd --reload'
run 'sudo firewall-cmd --list-services'
step "4. Allow a port"
run 'sudo firewall-cmd --permanent --add-port=8080/tcp'
run 'sudo firewall-cmd --reload'
run 'sudo firewall-cmd --list-ports'
step "5. Remove a service"
run 'sudo firewall-cmd --permanent --remove-service=cockpit'
run 'sudo firewall-cmd --reload'
run 'sudo firewall-cmd --list-services'
