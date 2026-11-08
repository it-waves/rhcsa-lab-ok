. /tmp/lab/lib.sh
step "After the reboot"
run 'lsblk /dev/vdb'
step "5. Delete a partition"
run 'sudo parted -s /dev/vdb rm 2'
run 'sudo parted /dev/vdb print'
run 'lsblk /dev/vdb'
