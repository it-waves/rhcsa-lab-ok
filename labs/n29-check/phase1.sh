. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
# lab setup, not shown: key for localhost and the practice files
mkdir -p ~/.ssh; chmod 700 ~/.ssh
[ -f ~/.ssh/id_ed25519 ] || ssh-keygen -q -t ed25519 -N "" -f ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
ssh-keyscan -t ed25519 localhost >> ~/.ssh/known_hosts 2>/dev/null
echo 'exam notes' > ~/exam.txt; mkdir -p ~/docs; echo one > ~/docs/a.txt; echo two > ~/docs/b.txt
rm -rf /tmp/exam-copy.txt /tmp/docs-backup
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'scp ~/exam.txt student@localhost:/tmp/exam-copy.txt'
run 'rsync -av ~/docs/ student@localhost:/tmp/docs-backup/'
run 'bash /tmp/lab/check.sh'
