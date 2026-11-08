. /tmp/lab/lib.sh
step "Solution"
run 'dnf provides /usr/bin/telnet'
run 'rpm -q telnet'
srun 'dnf -y install telnet'
srun 'dnf -y install tree'
srun 'dnf -y remove tree'
run 'mkdir lab13'
run 'echo "telnet" > lab13/answer.txt'
step "Checker"
run 'bash /tmp/lab/check.sh'
