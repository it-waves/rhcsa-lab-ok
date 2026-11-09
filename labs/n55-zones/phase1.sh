. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf install -y -q firewalld >/dev/null 2>&1
sudo systemctl enable --now firewalld >/dev/null 2>&1
sudo firewall-cmd --state >/dev/null 2>&1
step "1. Zones"
run 'sudo firewall-cmd --get-default-zone'
run 'sudo firewall-cmd --get-active-zones'
run 'sudo firewall-cmd --list-all'
step "2. A runtime rule"
run 'sudo firewall-cmd --add-service=http'
run 'sudo firewall-cmd --list-services'
run 'sudo firewall-cmd --reload'
run 'sudo firewall-cmd --list-services'
step "3. Runtime to permanent"
run 'sudo firewall-cmd --add-service=http'
run 'sudo firewall-cmd --runtime-to-permanent'
run 'sudo firewall-cmd --reload'
run 'sudo firewall-cmd --list-services'
step "4. A port in a zone"
run 'sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp'
run 'sudo firewall-cmd --reload'
run 'sudo firewall-cmd --zone=public --list-ports'
step "5. Change the default zone"
run 'sudo firewall-cmd --set-default-zone=work'
run 'sudo firewall-cmd --get-default-zone'
run 'sudo firewall-cmd --get-active-zones'
