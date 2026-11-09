. /tmp/lab/lib.sh
step "After the reboot"
run 'umask'
run 'touch file3'
run 'ls -l file3'
