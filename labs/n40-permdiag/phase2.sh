. /tmp/lab/lib.sh
step "After the reboot"
run 'ls -l deploy.sh'
run './deploy.sh'
run 'cat /srv/proj/reports/q3.txt'
