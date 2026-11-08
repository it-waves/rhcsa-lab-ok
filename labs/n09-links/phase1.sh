. /tmp/lab/lib.sh
step "1. Create a file to link to"
run 'mkdir links'
run 'echo "original data" > links/report.txt'
run 'ls -l links'
step "2. Hard link"
run 'ln links/report.txt links/report-hard.txt'
run 'ls -li links'
run 'cat links/report-hard.txt'
step "3. Soft link"
run 'ln -s report.txt links/report-soft.txt'
run 'ls -li links'
run 'cat links/report-soft.txt'
run 'readlink links/report-soft.txt'
step "4. Change one name, see the other"
run 'echo "more data" >> links/report.txt'
run 'cat links/report-hard.txt'
run 'cat links/report-soft.txt'
step "5. Delete the original"
run 'rm links/report.txt'
run 'ls -li links'
run 'cat links/report-hard.txt'
run 'cat links/report-soft.txt'
step "Practice task, solved (not shown in the video)"
run 'echo "lab9" > links/base.txt'
run 'ln links/base.txt links/base-hard.txt'
run 'ln -s base.txt links/base-soft.txt'
run 'ls -li links'
