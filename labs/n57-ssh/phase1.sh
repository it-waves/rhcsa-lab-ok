. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd olga >/dev/null 2>&1
echo "olga:LabPass-57" | sudo chpasswd
printf "PasswordAuthentication yes\n" | sudo tee /etc/ssh/sshd_config.d/10-lab-password.conf >/dev/null
sudo systemctl reload sshd >/dev/null 2>&1
cat > /tmp/askpass.sh <<EOS
#!/bin/sh
case "\$1" in *continue\ connecting*) echo yes;; *) echo LabPass-57;; esac
EOS
chmod +x /tmp/askpass.sh
printf "export SSH_ASKPASS=/tmp/askpass.sh SSH_ASKPASS_REQUIRE=force\n" >> ~/.bashrc
step "1. Create a key pair"
run "ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519"
run 'ls -l ~/.ssh'
step "2. Copy the public key to the server"
run 'ssh-copy-id olga@localhost'
step "3. What the server now has"
run 'sudo ls -ld /home/olga/.ssh'
run 'sudo ls -l /home/olga/.ssh'
run 'sudo cat /home/olga/.ssh/authorized_keys'
step "4. Log in with the key"
run 'ssh -o BatchMode=yes olga@localhost id'
run 'ssh -o BatchMode=yes olga@localhost hostname'
