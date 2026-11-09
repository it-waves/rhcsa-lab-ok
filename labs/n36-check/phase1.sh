. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install dosfstools >/dev/null 2>&1
sudo parted -s /dev/vdb mklabel gpt >/dev/null 2>&1
sudo parted -s /dev/vdb mkpart a 1MiB 301MiB >/dev/null 2>&1
sudo parted -s /dev/vdb mkpart b 301MiB 601MiB >/dev/null 2>&1
sudo mkdir /mnt/data1 /mnt/data2
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo mkfs.xfs /dev/vdb1'
run 'sudo mkfs.vfat /dev/vdb2'
run 'sudo mount /dev/vdb1 /mnt/data1'
run 'sudo mount /dev/vdb2 /mnt/data2'
run 'echo exam | sudo tee /mnt/data1/ok.txt'
run 'sudo umount /mnt/data2'
run 'bash /tmp/lab/check.sh'
