. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install nfs-utils >/dev/null 2>&1
sudo mkdir /srv/share
echo 'welcome from the server' | sudo tee /srv/share/hello.txt >/dev/null
echo '/srv/share 127.0.0.1(rw,sync)' | sudo tee /etc/exports >/dev/null
sudo systemctl enable --now nfs-server >/dev/null 2>&1
sudo exportfs -ra
step "1. The server shares a folder"
run 'showmount -e localhost'
step "2. Mount it"
run 'sudo mkdir /mnt/nfs'
run 'sudo mount -t nfs localhost:/srv/share /mnt/nfs'
run 'df -hT /mnt/nfs'
step "3. Use it"
run 'ls /mnt/nfs'
run 'cat /mnt/nfs/hello.txt'
run 'findmnt /mnt/nfs'
step "4. Unmount"
run 'sudo umount /mnt/nfs'
run 'findmnt /mnt/nfs'
run 'ls /mnt/nfs'
