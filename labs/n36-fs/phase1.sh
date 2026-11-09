. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install dosfstools >/dev/null 2>&1
step "1. Start: a blank disk"
run 'lsblk /dev/vdb'
step "2. Three partitions"
run 'sudo parted -s /dev/vdb mklabel gpt'
run 'sudo parted -s /dev/vdb mkpart fat 1MiB 301MiB'
run 'sudo parted -s /dev/vdb mkpart ext 301MiB 601MiB'
run 'sudo parted -s /dev/vdb mkpart xfs 601MiB 901MiB'
run 'lsblk /dev/vdb'
step "3. Create the file systems"
run 'sudo mkfs.vfat /dev/vdb1'
run 'sudo mkfs.ext4 /dev/vdb2'
run 'sudo mkfs.xfs /dev/vdb3'
run 'lsblk -f /dev/vdb'
step "4. Mount them"
run 'sudo mkdir /mnt/fat'
run 'sudo mkdir /mnt/ext'
run 'sudo mkdir /mnt/xfs'
run 'sudo mount /dev/vdb1 /mnt/fat'
run 'sudo mount /dev/vdb2 /mnt/ext'
run 'sudo mount /dev/vdb3 /mnt/xfs'
run 'df -hT /mnt/fat /mnt/ext /mnt/xfs'
step "5. Use them"
run 'echo hello | sudo tee /mnt/ext/note.txt'
run 'ls /mnt/ext'
run 'findmnt /mnt/xfs'
step "6. Unmount"
run 'sudo umount /mnt/fat'
run 'sudo umount /mnt/ext'
run 'sudo umount /mnt/xfs'
run 'findmnt /mnt/ext'
run 'df -hT /mnt/ext'
