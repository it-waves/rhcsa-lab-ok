. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install nfs-utils >/dev/null 2>&1
sudo mkdir /srv/exam /srv/old /mnt/exam /mnt/old
echo 'exam ok' | sudo tee /srv/exam/hello.txt >/dev/null
printf '/srv/exam 127.0.0.1(rw,sync)\n/srv/old 127.0.0.1(rw,sync)\n' | sudo tee /etc/exports >/dev/null
sudo systemctl enable --now nfs-server >/dev/null 2>&1
sudo exportfs -ra
sudo mount -t nfs localhost:/srv/old /mnt/old
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo mount -t nfs localhost:/srv/exam /mnt/exam'
run 'cat /mnt/exam/hello.txt'
run 'sudo umount /mnt/old'
run 'bash /tmp/lab/check.sh'
