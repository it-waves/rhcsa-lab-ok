. /tmp/lab/lib.sh
step "After the reboot"
run 'lsblk -f /dev/vdb'
run 'sudo mount /dev/vdb2 /mnt/ext'
run 'cat /mnt/ext/note.txt'
