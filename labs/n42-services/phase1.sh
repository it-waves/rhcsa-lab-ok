. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install httpd >/dev/null 2>&1
step "1. Look at the service"
run 'systemctl status httpd --no-pager'
step "2. Start and stop it now"
run 'sudo systemctl start httpd'
run 'systemctl is-active httpd'
run 'sudo systemctl restart httpd'
run 'sudo systemctl stop httpd'
run 'systemctl is-active httpd'
step "3. Start it automatically at boot"
run 'systemctl is-enabled httpd'
run 'sudo systemctl enable httpd'
run 'systemctl is-enabled httpd'
run 'systemctl is-active httpd'
step "4. Both in one command"
run 'sudo systemctl enable --now httpd'
run 'systemctl is-active httpd'
