. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Where is the journal stored?"
run 'ls -d /run/log/journal /var/log/journal'
run 'sudo journalctl --disk-usage'
run 'grep Storage /etc/systemd/journald.conf'
step "2. Make it persistent"
run "sudo sed -i 's/^#Storage=.*/Storage=persistent/' /etc/systemd/journald.conf"
run 'grep Storage /etc/systemd/journald.conf'
run 'sudo systemctl restart systemd-journald'
run 'sudo journalctl --flush'
step "3. Check the result"
run 'ls /var/log/journal'
run 'sudo journalctl --list-boots --no-pager'
run 'sudo journalctl --disk-usage'
