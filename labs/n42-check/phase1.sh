. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install httpd at >/dev/null 2>&1
sudo systemctl enable --now atd >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo systemctl enable --now httpd'
run 'sudo systemctl disable --now atd'
run 'bash /tmp/lab/check.sh'
