. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'ls lab8/a lab8/b'
step "Run the practice-task checker"
run 'bash /tmp/lab/check.sh'
