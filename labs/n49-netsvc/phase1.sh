. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo systemctl disable --now rpcbind.service rpcbind.socket >/dev/null 2>&1
step "1. Which network services start at boot?"
run 'systemctl is-enabled NetworkManager'
run 'systemctl is-enabled sshd'
run 'systemctl is-enabled rpcbind'
step "2. Is rpcbind running?"
run 'systemctl is-active rpcbind'
run "ss -tln | grep ':111 '"
step "3. Enable it and start it now"
run 'sudo systemctl enable --now rpcbind'
run 'systemctl is-enabled rpcbind'
run 'systemctl is-active rpcbind'
run "ss -tln | grep ':111 '"
