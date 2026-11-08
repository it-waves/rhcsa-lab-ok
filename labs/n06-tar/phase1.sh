. /tmp/lab/lib.sh
step "1. Something to archive"
run 'mkdir project'
run 'echo "project notes" > project/readme.txt'
run 'cp /etc/services project/services'
run 'ls -l project'
step "2. tar: create and list an archive"
run 'tar -cf project.tar project'
run 'tar -tf project.tar'
run 'ls -l project.tar'
step "3. tar: extract"
run 'mkdir restore'
run 'tar -xf project.tar -C restore'
run 'ls restore/project'
step "4. gzip and bzip2 with tar"
run 'tar -czf project.tar.gz project'
run 'tar -cjf project.tar.bz2 project'
run 'ls -l project.tar project.tar.gz project.tar.bz2'
step "5. gzip and bzip2 on their own"
run 'cp /etc/services data.txt'
run 'gzip data.txt'
run 'ls -l data.txt.gz'
run 'gunzip data.txt.gz'
run 'bzip2 data.txt'
run 'ls -l data.txt.bz2'
run 'bunzip2 data.txt.bz2'
run 'ls -l data.txt'
step "Practice task, solved (not shown in the video)"
run 'tar -czf backup.tar.gz project'
run 'mkdir lab6'
run 'tar -xzf backup.tar.gz -C lab6'
run 'ls lab6/project'
