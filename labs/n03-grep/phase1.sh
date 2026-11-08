. /tmp/lab/lib.sh
# Lab preparation (silent): the sample log file the video uses; the kit shows learners the same block.
printf '%s\n' \
 '2026-11-07 09:01 INFO web started' \
 '2026-11-07 09:02 INFO db connected' \
 '2026-11-07 09:05 WARNING disk at 85 percent' \
 '2026-11-07 09:07 ERROR login failed for user alice' \
 '2026-11-07 09:08 INFO backup finished' \
 '2026-11-07 09:09 ERROR login failed for user bob' \
 '2026-11-07 09:12 error timeout talking to db' \
 '2026-11-07 09:15 INFO web stopped' > ~/server.log
step "1. The sample file"
run 'cat server.log'
step "2. grep: find lines that match"
run 'grep ERROR server.log'
run 'grep error server.log'
run 'grep -i error server.log'
step "3. Useful options"
run 'grep -v INFO server.log'
run 'grep -c ERROR server.log'
run 'grep -n WARNING server.log'
step "4. Regular expressions"
run "grep '^2026-11-07 09:0' server.log"
run "grep 'db\$' server.log"
run "grep 'ERROR.*alice' server.log"
run "grep 'user [ab]' server.log"
step "5. Extended expressions: -E"
run "grep -E 'ERROR|WARNING' server.log"
run "grep -E '[0-9]+ percent' server.log"
step "6. Search many files, and use a pipe"
run 'grep -r sshd /etc/pam.d'
run 'grep -r PermitRootLogin /etc/ssh'
run 'sudo grep -r PermitRootLogin /etc/ssh'
run 'ls /etc | grep ssh'
step "Practice task, solved (not shown in the video)"
run 'mkdir lab4'
run 'grep -i error server.log > lab4/errors.txt'
run 'cat lab4/errors.txt'
