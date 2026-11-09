. /tmp/lab/lib.sh
step "After the reboot"
run 'sudo lvs'
run 'df -h /mnt/app'
run 'cat /mnt/app/important.txt'
