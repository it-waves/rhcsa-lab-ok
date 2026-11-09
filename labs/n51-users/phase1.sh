. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Create a user"
run 'sudo useradd alice'
run 'id alice'
run 'getent passwd alice'
run 'ls -d /home/alice'
step "2. Create a user with options"
run 'sudo useradd -u 1500 -c "Bob Lee" -s /bin/bash bob'
run 'getent passwd bob'
step "3. Modify a user"
run 'sudo usermod -s /usr/sbin/nologin alice'
run 'sudo usermod -c "Alice Chen" alice'
run 'getent passwd alice'
step "4. Delete a user"
run 'sudo userdel bob'
run 'getent passwd bob'
run 'ls -d /home/bob'
run 'sudo useradd carol'
run 'sudo userdel -r carol'
run 'ls -d /home/carol'
