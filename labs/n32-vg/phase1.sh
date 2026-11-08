. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb /dev/vdc >/dev/null 2>&1
step "1. Start: two physical volumes, no group"
run 'sudo pvs'
run 'sudo vgs'
step "2. Create a volume group"
run 'sudo vgcreate vgdata /dev/vdb'
run 'sudo vgs'
run 'sudo pvs'
step "3. Add the second physical volume"
run 'sudo vgextend vgdata /dev/vdc'
run 'sudo vgs'
run 'sudo pvs'
