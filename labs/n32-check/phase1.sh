. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb /dev/vdc >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo vgcreate examvg /dev/vdb'
run 'sudo vgextend examvg /dev/vdc'
run 'bash /tmp/lab/check.sh'
