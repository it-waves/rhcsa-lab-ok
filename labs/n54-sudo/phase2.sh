. /tmp/lab/lib.sh
step "After the reboot"
run 'getent group wheel'
run 'sudo -l -U bob'
