. /tmp/lab/lib.sh
step "1. How long has it been up?"
run 'uptime -p'
run 'who -b'
step "2. Schedule a shutdown, then cancel it"
run 'sudo shutdown -h +10'
run 'sudo shutdown -c'
step "3. Is the system healthy?"
run 'systemctl is-system-running'
