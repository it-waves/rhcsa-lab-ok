. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. File context"
run 'ls -Z /etc/passwd'
run 'ls -Z /etc/shadow'
run 'ls -dZ /var/log'
run 'ls -dZ /home/student'
step "2. Process context"
run 'ps -Z -C sshd'
run 'ps -Z -C crond'
step "3. Your own context"
run 'id -Z'
run 'ps -Z'
