. /tmp/lab/lib.sh
step "After the reboot"
run 'systemctl is-enabled autofs'
run 'findmnt /mnt/auto/data'
run 'cat /mnt/auto/data/hello.txt'
run 'findmnt /mnt/auto/data'
