. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo pvcreate /dev/vdb /dev/vdc >/dev/null 2>&1
sudo vgcreate vgexam /dev/vdb /dev/vdc >/dev/null 2>&1
sudo lvcreate -y -n lvexam -L 300M vgexam >/dev/null 2>&1
sudo mkfs.ext4 -q -L examlabel /dev/vgexam/lvexam >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo mkdir /mnt/exam'
run "echo 'LABEL=examlabel /mnt/exam ext4 defaults 0 0' | sudo tee -a /etc/fstab"
run 'sudo systemctl daemon-reload'
run 'sudo mount -a'
run 'bash /tmp/lab/check.sh'
