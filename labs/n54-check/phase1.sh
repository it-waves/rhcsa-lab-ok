. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd gina >/dev/null 2>&1
sudo useradd hank >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo usermod -aG wheel gina'
run "echo 'hank ALL=(ALL) NOPASSWD: /usr/bin/systemctl' | sudo tee /etc/sudoers.d/hank"
run 'sudo chmod 0440 /etc/sudoers.d/hank'
run 'bash /tmp/lab/check.sh'
