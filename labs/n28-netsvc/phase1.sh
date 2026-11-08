. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Which network services are listening?"
run 'ss -tln'
run 'sudo ss -tlnp'
step "2. Check the status"
run 'systemctl status sshd --no-pager | head -n 3'
run 'systemctl is-active sshd'
run 'systemctl is-enabled sshd'
run 'systemctl status chronyd --no-pager | head -n 3'
step "3. Stop and start"
run 'sudo systemctl stop chronyd'
run 'systemctl is-active chronyd'
run 'sudo systemctl start chronyd'
run 'systemctl is-active chronyd'
run 'sudo systemctl restart chronyd'
run 'systemctl is-active chronyd'
step "4. Boot behaviour"
run 'sudo systemctl disable chronyd'
run 'systemctl is-enabled chronyd'
run 'systemctl is-active chronyd'
