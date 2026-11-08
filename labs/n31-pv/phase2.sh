. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo pvs'
step "4. Remove the physical volume"
run 'sudo pvremove /dev/vdb'
run 'sudo pvs'
run 'lsblk /dev/vdb'
