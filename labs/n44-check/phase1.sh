. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install chrony >/dev/null 2>&1
sudo systemctl disable --now chronyd >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "echo 'server ntp.lab.example iburst' | sudo tee -a /etc/chrony.conf"
run 'sudo systemctl enable --now chronyd'
run 'bash /tmp/lab/check.sh'
