. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd dave >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'echo "Linux#2026" | sudo passwd --stdin dave'
run 'sudo chage -m 2 dave'
run 'sudo chage -M 60 dave'
run 'sudo chage -W 10 dave'
run 'sudo passwd -e dave'
run 'bash /tmp/lab/check.sh'
