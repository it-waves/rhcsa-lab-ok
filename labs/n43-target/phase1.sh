. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo systemctl set-default graphical.target >/dev/null 2>&1
step "1. Which target is the default?"
run 'systemctl get-default'
step "2. Change the default"
run 'sudo systemctl set-default multi-user.target'
run 'systemctl get-default'
run 'ls -l /etc/systemd/system/default.target'
