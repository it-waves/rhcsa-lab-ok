. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
# lab setup, not shown in the video: a key so that localhost accepts us without a prompt
mkdir -p ~/.ssh; chmod 700 ~/.ssh
[ -f ~/.ssh/id_ed25519 ] || ssh-keygen -q -t ed25519 -N "" -f ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
ssh-keyscan -t ed25519 localhost >> ~/.ssh/known_hosts 2>/dev/null
step "1. Prepare a file"
run "echo 'quarterly report' > report.txt"
run 'ls -l report.txt'
step "2. Copy it to another system"
run 'scp report.txt student@localhost:/tmp/'
run 'ls -l /tmp/report.txt'
step "3. Copy it back"
run 'scp student@localhost:/tmp/report.txt copy.txt'
run 'ls -l copy.txt'
run 'cmp report.txt copy.txt'
step "4. A whole folder"
run 'mkdir project'
run 'echo one > project/a.txt'
run 'echo two > project/b.txt'
run 'scp -r project student@localhost:/tmp/'
run 'ssh student@localhost ls /tmp/project'
step "5. rsync"
run 'rpm -q rsync'
run 'rsync -av project/ student@localhost:/tmp/backup/'
run 'echo three > project/c.txt'
run 'rsync -av project/ student@localhost:/tmp/backup/'
step "6. sftp"
run "echo 'ls /tmp/report.txt' | sftp -b - student@localhost"
