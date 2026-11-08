. /tmp/lab/lib.sh
step "After the reboot"
run 'tuned-adm active'
run 'cat /etc/tuned/active_profile'
step "5. Go back to the recommended profile"
run 'sudo tuned-adm profile virtual-guest'
run 'tuned-adm active'
