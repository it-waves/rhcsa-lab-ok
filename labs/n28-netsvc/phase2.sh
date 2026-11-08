. /tmp/lab/lib.sh
step "After the reboot"
run 'systemctl is-enabled chronyd'
run 'systemctl is-active chronyd'
step "5. Enable and start in one command"
run 'sudo systemctl enable --now chronyd'
run 'systemctl is-enabled chronyd'
run 'systemctl is-active chronyd'
