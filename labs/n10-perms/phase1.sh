. /tmp/lab/lib.sh
step "1. List permissions"
run 'mkdir perms'
run 'echo "hello" > perms/report.txt'
run 'ls -l perms'
step "2. Change with letters"
run 'chmod u+x perms/report.txt'
run 'ls -l perms'
run 'chmod g+w perms/report.txt'
run 'ls -l perms'
run 'chmod o-r perms/report.txt'
run 'ls -l perms'
step "3. Change with numbers"
run 'chmod 640 perms/report.txt'
run 'ls -l perms'
run 'chmod 755 perms/report.txt'
run 'ls -l perms'
step "4. What the bits do"
run 'chmod u-r perms/report.txt'
run 'cat perms/report.txt'
run 'chmod u+r perms/report.txt'
run 'cat perms/report.txt'
step "5. Directories"
run 'mkdir perms/secret'
run 'touch perms/secret/a.txt'
run 'chmod u-x perms/secret'
run 'cd perms/secret'
run 'ls -ld perms/secret'
run 'chmod u+x perms/secret'
run 'ls perms/secret'
step "Practice task, solved (not shown in the video)"
run 'mkdir lab10'
run 'touch lab10/notes.txt'
run 'chmod 640 lab10/notes.txt'
run 'mkdir lab10/shared'
run 'chmod 750 lab10/shared'
run 'ls -l lab10'
