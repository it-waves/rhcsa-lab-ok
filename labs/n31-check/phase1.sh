. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo pvcreate /dev/vdc'
run 'sudo pvremove /dev/vdb'
run 'bash /tmp/lab/check.sh'
