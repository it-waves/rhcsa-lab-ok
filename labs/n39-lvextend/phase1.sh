. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb >/dev/null 2>&1
sudo vgcreate vgdata /dev/vdb >/dev/null 2>&1
sudo lvcreate -y -n lvapp -L 1G vgdata >/dev/null 2>&1
sudo mkfs.xfs -q /dev/vgdata/lvapp >/dev/null 2>&1
sudo mkdir /mnt/app
sudo sh -c "echo '/dev/vgdata/lvapp /mnt/app xfs defaults 0 0' >> /etc/fstab"
sudo systemctl daemon-reload
sudo mount -a
echo 'customer data' | sudo tee /mnt/app/important.txt >/dev/null
step "1. Start: a volume that is full of data"
run 'sudo vgs'
run 'df -h /mnt/app'
step "2. Extend the volume, then the file system"
run 'sudo lvextend -L +512M /dev/vgdata/lvapp'
run 'df -h /mnt/app'
run 'sudo xfs_growfs /mnt/app'
run 'df -h /mnt/app'
step "3. Not enough space in the group"
run 'sudo lvextend -r -L +6G /dev/vgdata/lvapp'
run 'sudo pvcreate /dev/vdc'
run 'sudo vgextend vgdata /dev/vdc'
run 'sudo lvextend -r -L +6G /dev/vgdata/lvapp'
run 'df -h /mnt/app'
run 'cat /mnt/app/important.txt'
