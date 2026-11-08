. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo vgs'
step "4. Take one out again"
run 'sudo vgreduce vgdata /dev/vdc'
run 'sudo vgs'
run 'sudo pvs'
