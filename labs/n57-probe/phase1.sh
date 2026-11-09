. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "probe"
run 'sudo sshd -T | grep -E "^(passwordauthentication|pubkeyauthentication|authorizedkeysfile|permitrootlogin|kbdinteractiveauthentication) "'
run 'ls -la ~/.ssh'
run 'ls /etc/ssh/sshd_config.d/'
run 'sudo cat /etc/ssh/sshd_config.d/*.conf'
run 'ssh -V'
run 'which ssh-copy-id ssh-keygen ssh-agent ssh-add'
run 'getenforce'
run 'tty'
sudo useradd olga >/dev/null 2>&1
echo 'olga:LabPass-57' | sudo chpasswd
cat > /tmp/askpass.sh <<'EOS'
#!/bin/sh
echo 'LabPass-57'
EOS
chmod +x /tmp/askpass.sh
step "copy-id test"
run "ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/lab_key"
run 'ls -l ~/.ssh'
run 'SSH_ASKPASS=/tmp/askpass.sh SSH_ASKPASS_REQUIRE=force ssh-copy-id -i ~/.ssh/lab_key.pub olga@localhost'
run 'ssh -i ~/.ssh/lab_key -o StrictHostKeyChecking=accept-new olga@localhost id'
run 'sudo ls -la /home/olga/.ssh'
run 'sudo cat /home/olga/.ssh/authorized_keys'
