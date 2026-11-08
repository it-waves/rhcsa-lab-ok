. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb /dev/vdc >/dev/null 2>&1
sudo vgcreate vgdata /dev/vdb /dev/vdc >/dev/null 2>&1
sudo lvcreate -y -n lvapp -L 500M vgdata >/dev/null 2>&1
sudo lvcreate -y -n lvdata -L 500M vgdata >/dev/null 2>&1
sudo mkfs.ext4 -q -L appdata /dev/vgdata/lvapp >/dev/null 2>&1
sudo mkfs.ext4 -q /dev/vgdata/lvdata >/dev/null 2>&1
step "1. Start: two formatted volumes, not mounted"
run 'findmnt /mnt/app'
run 'sudo blkid /dev/vgdata/lvapp'
run 'sudo blkid /dev/vgdata/lvdata'
step "2. Mount by label"
run 'sudo mkdir /mnt/app'
run "echo 'LABEL=appdata /mnt/app ext4 defaults 0 0' | sudo tee -a /etc/fstab"
run 'sudo systemctl daemon-reload'
run 'sudo mount -a'
run 'findmnt /mnt/app'
step "3. Mount by UUID"
U=$(sudo blkid -s UUID -o value /dev/vgdata/lvdata)
run 'sudo mkdir /mnt/data'
run "echo 'UUID=$U /mnt/data ext4 defaults 0 0' | sudo tee -a /etc/fstab"
run 'sudo systemctl daemon-reload'
run 'sudo mount -a'
run 'findmnt /mnt/data'
step "4. The fstab file"
run 'tail -n 2 /etc/fstab'
