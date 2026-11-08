. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Is tuned installed?"
run 'rpm -q tuned'
run 'sudo dnf install -y tuned'
step "2. Start the service"
run 'sudo systemctl enable --now tuned'
run 'systemctl is-active tuned'
step "3. Look at the profiles"
run 'tuned-adm active'
run 'tuned-adm recommend'
run 'tuned-adm list | head -n 12'
step "4. Switch profile"
run 'sudo tuned-adm profile throughput-performance'
run 'tuned-adm active'
run 'sudo tuned-adm verify'
