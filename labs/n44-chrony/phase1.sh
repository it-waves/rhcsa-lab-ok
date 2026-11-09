. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install chrony >/dev/null 2>&1
step "1. The configuration"
run "grep -E '^(pool|server)' /etc/chrony.conf"
step "2. The service"
run 'systemctl is-enabled chronyd'
run 'systemctl is-active chronyd'
step "3. Add a time server"
run "echo 'server 0.pool.ntp.org iburst' | sudo tee -a /etc/chrony.conf"
run "grep -E '^(pool|server)' /etc/chrony.conf"
run 'sudo systemctl restart chronyd'
step "4. Check synchronization"
run 'sleep 20'
run 'chronyc sources'
run 'timedatectl'
