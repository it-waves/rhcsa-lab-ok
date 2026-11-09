. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf install -y -q firewalld >/dev/null 2>&1
sudo systemctl enable --now firewalld >/dev/null 2>&1
sudo firewall-cmd --state >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo firewall-cmd --zone=public --add-port=9090/tcp'
run 'sudo firewall-cmd --zone=public --add-service=https'
run 'sudo firewall-cmd --runtime-to-permanent'
run 'sudo firewall-cmd --set-default-zone=dmz'
run 'bash /tmp/lab/check.sh'
