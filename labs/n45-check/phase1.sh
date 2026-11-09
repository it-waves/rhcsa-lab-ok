. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install dnf-plugins-core >/dev/null 2>&1
sudo dnf -y -q remove zip unzip >/dev/null 2>&1
rm -f ~/*.rpm
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo dnf install -y zip'
run 'dnf download unzip'
run 'sudo dnf install -y ./unzip*.rpm'
run 'bash /tmp/lab/check.sh'
