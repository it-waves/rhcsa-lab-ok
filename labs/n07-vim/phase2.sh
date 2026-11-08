. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'cat lab7.txt'
step "Run the practice-task checker"
run 'bash /tmp/lab/check.sh'
