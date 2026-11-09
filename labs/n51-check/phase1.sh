. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd temp >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo useradd -u 3001 -c "Sam Smith" sam'
run 'sudo usermod -s /usr/sbin/nologin sam'
run 'sudo userdel -r temp'
run 'bash /tmp/lab/check.sh'
