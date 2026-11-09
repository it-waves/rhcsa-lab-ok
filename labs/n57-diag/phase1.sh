. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "diag"
run 'sudo ls -la /etc/ssh/sshd_config.d/'
run 'sudo grep -n -i -E "^(include|passwordauth|authenticationmethods|match|usepam)" /etc/ssh/sshd_config'
run 'sudo sshd -T | grep -i -E "passwordauth|authenticationmethods|usepam"'
printf "PasswordAuthentication yes\n" | sudo tee /etc/ssh/sshd_config.d/50-lab-password.conf >/dev/null
run 'sudo sshd -T | grep -i passwordauth'
run 'sudo systemctl reload sshd'
run 'sudo systemctl status sshd --no-pager -l'
run 'sudo systemctl list-units "ssh*" --no-pager'
run 'sudo sshd -T | grep -i passwordauth'
