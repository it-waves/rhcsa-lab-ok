. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install nfs-utils autofs >/dev/null 2>&1
sudo mkdir /srv/exam
echo 'exam ok' | sudo tee /srv/exam/hello.txt >/dev/null
echo '/srv/exam 127.0.0.1(rw,sync)' | sudo tee /etc/exports >/dev/null
sudo systemctl enable --now nfs-server >/dev/null 2>&1
sudo exportfs -ra
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'echo "/remote /etc/auto.remote" | sudo tee /etc/auto.master.d/remote.autofs'
run 'echo "exam -fstype=nfs4,rw localhost:/srv/exam" | sudo tee /etc/auto.remote'
run 'sudo systemctl enable --now autofs'
run 'cat /remote/exam/hello.txt'
run 'bash /tmp/lab/check.sh'
