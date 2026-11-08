. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. List the disks"
run 'lsblk'
run 'sudo parted /dev/vdb print'
step "2. Create a GPT label"
run 'sudo parted -s /dev/vdb mklabel gpt'
run 'sudo parted /dev/vdb print'
step "3. Create two partitions"
run 'sudo parted -s /dev/vdb mkpart data1 1MiB 1GiB'
run 'sudo parted -s /dev/vdb mkpart data2 1GiB 2GiB'
run 'sudo parted /dev/vdb print'
run 'lsblk /dev/vdb'
step "4. Another view"
run 'sudo fdisk -l /dev/vdb'
