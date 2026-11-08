. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Where are the log files?"
run 'ls /var/log | head -n 12'
run 'rpm -q rsyslog'
run 'ls -d /var/log/journal'
run 'ls /var/log/messages /var/log/secure'
run 'sudo tail -n 3 /var/log/secure'
step "2. Read the journal"
run 'sudo journalctl -u kdump -n 3 --no-pager'
run 'sudo journalctl -k -n 3 --no-pager'
run 'sudo journalctl -u sshd -n 4 --no-pager'
run 'sudo journalctl -p err -b --no-pager | tail -n 4'
step "3. Write a message and find it"
run 'logger -t n26 "hello from the lab"'
run 'sudo journalctl -t n26 --no-pager'
run 'sudo journalctl --since "5 minutes ago" -t n26 --no-pager'
step "4. Follow and count"
run 'sudo journalctl -b --no-pager | wc -l'
run 'sudo journalctl --list-boots --no-pager'
