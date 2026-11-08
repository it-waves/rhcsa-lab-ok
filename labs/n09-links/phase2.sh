. /tmp/lab/lib.sh
step "Reboot check"
run 'ls -li links'
run 'cat links/report-hard.txt'
run 'cat links/report-soft.txt'
run 'cat links/base-soft.txt'
