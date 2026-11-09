. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install nfs-utils autofs >/dev/null 2>&1
sudo mkdir /srv/share
echo 'welcome from the server' | sudo tee /srv/share/hello.txt >/dev/null
echo '/srv/share 127.0.0.0/8(rw,sync)' | sudo tee /etc/exports >/dev/null
sudo systemctl enable --now nfs-server >/dev/null 2>&1
sudo exportfs -ra
step "1. Master map: which folder autofs watches"
run 'echo "/mnt/auto /etc/auto.nfs --timeout=10" | sudo tee /etc/auto.master.d/nfs.autofs'
step "2. Map file: what to mount inside it"
run 'echo "data -fstype=nfs4,rw 127.0.0.2:/srv/share" | sudo tee /etc/auto.nfs'
step "3. Start autofs"
run 'sudo systemctl enable --now autofs'
step "4. Nothing is mounted yet"
run 'ls /mnt/auto'
run 'findmnt /mnt/auto/data'
step "5. Touch the folder: it mounts itself"
run 'ls /mnt/auto/data'
run 'cat /mnt/auto/data/hello.txt'
run 'findmnt /mnt/auto/data'
step "6. Leave it idle: it unmounts itself"
run 'sleep 20'
run 'findmnt /mnt/auto/data'
