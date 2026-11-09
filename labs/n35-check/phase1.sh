. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb >/dev/null 2>&1
sudo vgcreate vgexam /dev/vdb >/dev/null 2>&1
sudo lvcreate -y -n examdata -L 1G vgexam >/dev/null 2>&1
sudo mkfs.ext4 -q -L keep /dev/vgexam/examdata >/dev/null 2>&1
sudo mkdir /mnt/keep
sudo sh -c "echo 'LABEL=keep /mnt/keep ext4 defaults 0 0' >> /etc/fstab"
sudo systemctl daemon-reload
sudo mount -a
echo 'customer data' | sudo tee /mnt/keep/important.txt >/dev/null
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo parted -s /dev/vdc mklabel gpt'
run 'sudo parted -s /dev/vdc mkpart swap 1MiB 513MiB'
run 'sudo mkswap /dev/vdc1'
run 'sudo swapon /dev/vdc1'
U=$(sudo blkid -s UUID -o value /dev/vdc1)
run "echo 'UUID=$U none swap defaults 0 0' | sudo tee -a /etc/fstab"
run 'sudo lvcreate -n examnew -L 200M vgexam'
run 'bash /tmp/lab/check.sh'
