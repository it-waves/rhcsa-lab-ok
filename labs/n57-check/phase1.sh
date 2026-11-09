. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd pat >/dev/null 2>&1
echo "pat:LabPass-57" | sudo chpasswd
printf "PasswordAuthentication yes\n" | sudo tee /etc/ssh/sshd_config.d/10-lab-password.conf >/dev/null
sudo systemctl reload sshd >/dev/null 2>&1
cat > /tmp/askpass.sh <<EOS
#!/bin/sh
case "\$1" in *continue\ connecting*) echo yes;; *) echo LabPass-57;; esac
EOS
chmod +x /tmp/askpass.sh
printf "export SSH_ASKPASS=/tmp/askpass.sh SSH_ASKPASS_REQUIRE=force\n" >> ~/.bashrc
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/pat_key"
run 'ssh-copy-id -i ~/.ssh/pat_key.pub pat@localhost'
run 'bash /tmp/lab/check.sh'
