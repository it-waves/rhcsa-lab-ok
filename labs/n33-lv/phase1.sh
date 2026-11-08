. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb /dev/vdc >/dev/null 2>&1
sudo vgcreate vgdata /dev/vdb /dev/vdc >/dev/null 2>&1
step "1. Start: a group with free space, no logical volumes"
run 'sudo vgs'
run 'sudo lvs'
step "2. Create a logical volume"
run 'sudo lvcreate -n lvdata -L 1G vgdata'
run 'sudo lvs'
step "3. Create a second one"
run 'sudo lvcreate -n lvlogs -L 500M vgdata'
run 'sudo lvs'
step "4. The device files"
run 'ls -l /dev/vgdata'
run 'sudo vgs'
