. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo parted -s /dev/vdb mklabel gpt >/dev/null 2>&1
sudo parted -s /dev/vdb mkpart pv 1MiB 1GiB >/dev/null 2>&1
sudo udevadm settle
sudo pvcreate /dev/vdb1 >/dev/null 2>&1
sudo vgcreate vgexam /dev/vdb1 >/dev/null 2>&1
sudo lvcreate -y -n lvexam -L 600M vgexam >/dev/null 2>&1
sudo mkfs.xfs -q /dev/vgexam/lvexam >/dev/null 2>&1
sudo mkdir /mnt/exam
sudo sh -c "echo '/dev/vgexam/lvexam /mnt/exam xfs defaults 0 0' >> /etc/fstab"
sudo systemctl daemon-reload
sudo mount -a
echo 'exam ok' | sudo tee /mnt/exam/hello.txt >/dev/null
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo pvcreate /dev/vdc'
run 'sudo vgextend vgexam /dev/vdc'
run 'sudo lvextend -r -L 2G /dev/vgexam/lvexam'
run 'bash /tmp/lab/check.sh'
