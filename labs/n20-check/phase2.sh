. /tmp/lab/lib.sh
step "After the reboot"
run 'mkdir lab20'
run 'who -b > lab20/boot.txt'
run 'bash /tmp/lab/check.sh'
step "Checker fails while a shutdown is scheduled"
run 'sudo shutdown -h +20'
run 'bash /tmp/lab/check.sh'
run 'sudo shutdown -c'
run 'bash /tmp/lab/check.sh'
