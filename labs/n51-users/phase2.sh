. /tmp/lab/lib.sh
step "After the reboot"
run 'getent passwd alice'
run 'getent passwd bob'
