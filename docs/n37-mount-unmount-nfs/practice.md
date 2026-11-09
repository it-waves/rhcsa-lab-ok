# Practice task: NFS

Work as `student`.

**Setup (once).** One machine acts as server and client:

```
sudo dnf -y install nfs-utils
sudo mkdir /srv/exam
sudo mkdir /srv/old
sudo mkdir /mnt/exam
sudo mkdir /mnt/old
echo 'exam ok' | sudo tee /srv/exam/hello.txt
printf '/srv/exam 127.0.0.1(rw,sync)\n/srv/old 127.0.0.1(rw,sync)\n' | sudo tee /etc/exports
sudo systemctl enable --now nfs-server
sudo exportfs -ra
sudo mount -t nfs localhost:/srv/old /mnt/old
```

**Task.**

1. Mount `localhost:/srv/exam` on `/mnt/exam` with type `nfs`.
2. Read `hello.txt` through the mount.
3. Unmount `/mnt/old`.
4. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
