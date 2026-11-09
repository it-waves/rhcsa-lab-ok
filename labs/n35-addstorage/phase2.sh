. /tmp/lab/lib.sh
step "After the reboot"
run 'swapon --show'
run 'sudo lvs'
run 'cat /mnt/app/important.txt'
