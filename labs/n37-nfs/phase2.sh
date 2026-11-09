. /tmp/lab/lib.sh
step "After the reboot"
run 'findmnt /mnt/nfs'
run 'showmount -e localhost'
run 'sudo mount -t nfs localhost:/srv/share /mnt/nfs'
run 'cat /mnt/nfs/hello.txt'
