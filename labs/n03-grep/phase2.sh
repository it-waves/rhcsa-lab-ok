. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'ls -l lab4'
step "Run the practice-task checker"
run 'bash /tmp/lab/check.sh'
