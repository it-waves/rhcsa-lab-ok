. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'sudo ls -l /home/alice/lab2.txt'
step "Run the practice-task checker"
run 'bash /tmp/lab/check.sh'
