. /tmp/lab/lib.sh
step "Install and start"
run 'sudo dnf install -y tuned'
run 'sudo systemctl enable --now tuned'
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Set the profile"
run 'sudo tuned-adm profile powersave'
run 'bash /tmp/lab/check.sh'
