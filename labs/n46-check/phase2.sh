. /tmp/lab/lib.sh
step "Check after the reboot"
run 'bash /tmp/lab/check.sh'
run 'cat /proc/cmdline'
