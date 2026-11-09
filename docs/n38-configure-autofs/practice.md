# Practice task: autofs

Work as `student`.

**Setup (once).** One machine acts as server and client:

```
sudo dnf -y install nfs-utils autofs
sudo mkdir /srv/exam
echo 'exam ok' | sudo tee /srv/exam/hello.txt
echo '/srv/exam 127.0.0.0/8(rw,sync)' | sudo tee /etc/exports
sudo systemctl enable --now nfs-server
sudo exportfs -ra
```

**Task.** The server `127.0.0.2` shares `/srv/exam`.

1. Configure autofs so that `/remote/exam` mounts it with type `nfs4`, read and write.
2. autofs must be enabled and running.
3. Reading `/remote/exam/hello.txt` must work.
4. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
