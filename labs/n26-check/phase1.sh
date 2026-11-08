. /tmp/lab/lib.sh
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'logger -t ex200 "practice message"'
run 'sudo journalctl -t ex200 --no-pager > ~/ex200.log'
run 'bash /tmp/lab/check.sh'
