. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. The default umask"
run 'umask'
run 'umask -S'
run 'touch file1'
run 'mkdir dir1'
run 'ls -ld file1 dir1'
step "2. A new umask, for this user"
run "echo 'umask 027' >> ~/.bashrc"
run 'tail -n 1 ~/.bashrc'
run 'umask'
run 'umask -S'
run 'touch file2'
run 'mkdir dir2'
run 'ls -ld file2 dir2'
step "3. Where the system default comes from"
run 'grep -n umask /etc/bashrc'
run 'grep -n UMASK /etc/login.defs'
