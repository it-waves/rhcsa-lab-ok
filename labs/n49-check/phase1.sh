. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo systemctl disable --now nfs-server >/dev/null 2>&1
sudo systemctl enable --now cockpit.socket >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo systemctl enable --now nfs-server'
run 'sudo systemctl disable --now cockpit.socket'
run 'bash /tmp/lab/check.sh'
