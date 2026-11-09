. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb >/dev/null 2>&1
sudo vgcreate vgdata /dev/vdb >/dev/null 2>&1
sudo lvcreate -y -n lvapp -L 1G vgdata >/dev/null 2>&1
sudo mkfs.ext4 -q -L appdata /dev/vgdata/lvapp >/dev/null 2>&1
sudo mkdir /mnt/app
sudo sh -c "echo 'LABEL=appdata /mnt/app ext4 defaults 0 0' >> /etc/fstab"
sudo systemctl daemon-reload
sudo mount -a
echo 'customer data' | sudo tee /mnt/app/important.txt >/dev/null
step "1. Start: a group in use, a blank disk"
run 'cat /mnt/app/important.txt'
run 'sudo vgs'
run 'lsblk /dev/vdc'
step "2. Partition the new disk"
run 'sudo parted -s /dev/vdc mklabel gpt'
run 'sudo parted -s /dev/vdc mkpart pv 1MiB 2GiB'
run 'sudo parted -s /dev/vdc mkpart swap 2GiB 2560MiB'
run 'lsblk /dev/vdc'
step "3. Grow the volume group"
run 'sudo pvcreate /dev/vdc1'
run 'sudo vgextend vgdata /dev/vdc1'
run 'sudo vgs'
step "4. Add a logical volume"
run 'sudo lvcreate -n lvnew -L 1G vgdata'
run 'sudo lvs'
step "5. Add swap"
run 'sudo mkswap /dev/vdc2'
run 'sudo swapon /dev/vdc2'
run 'swapon --show'
U=$(sudo blkid -s UUID -o value /dev/vdc2)
run "echo 'UUID=$U none swap defaults 0 0' | sudo tee -a /etc/fstab"
step "6. The old data is untouched"
run 'cat /mnt/app/important.txt'
