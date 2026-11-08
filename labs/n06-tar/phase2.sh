. /tmp/lab/lib.sh
step "After the reboot"
run 'uptime -p'
run 'ls -l backup.tar.gz'
run 'ls lab6/project'
step "Run the practice-task checker"
run 'bash /tmp/lab/check.sh'
