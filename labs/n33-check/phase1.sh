. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb /dev/vdc >/dev/null 2>&1
sudo vgcreate examvg /dev/vdb /dev/vdc >/dev/null 2>&1
sudo lvcreate -y -n oldlv -L 100M examvg >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo lvcreate -n examlv -L 300M examvg'
run 'sudo lvremove -y examvg/oldlv'
run 'bash /tmp/lab/check.sh'
