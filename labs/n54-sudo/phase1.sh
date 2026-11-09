. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Who can use sudo?"
run 'sudo -l'
run 'getent group wheel'
run "sudo grep '^%wheel' /etc/sudoers"
step "2. Full sudo for a user: the wheel group"
run 'sudo useradd alice'
run 'sudo usermod -aG wheel alice'
run 'getent group wheel'
run 'sudo -l -U alice'
step "3. A rule for one command"
run 'sudo useradd bob'
run "echo 'bob ALL=(ALL) NOPASSWD: /usr/bin/systemctl' | sudo tee /etc/sudoers.d/bob"
run 'sudo chmod 0440 /etc/sudoers.d/bob'
run 'sudo visudo -c'
run 'sudo -l -U bob'
step "4. Test the rule"
run 'sudo -u bob sudo -n /usr/bin/systemctl is-active sshd'
run 'sudo -u bob sudo -n /usr/bin/id'
