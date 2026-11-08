. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Before: no physical volumes on vdb"
run 'sudo pvs'
step "2. Create a physical volume"
run 'sudo pvcreate /dev/vdb'
run 'sudo pvs'
step "3. Details"
run 'sudo pvdisplay /dev/vdb'
