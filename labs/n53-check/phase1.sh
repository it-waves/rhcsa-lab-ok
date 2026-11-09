. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd erin >/dev/null 2>&1
sudo useradd frank >/dev/null 2>&1
sudo groupadd temp >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo groupadd -g 4000 ops'
run 'sudo usermod -aG ops erin'
run 'sudo usermod -aG ops frank'
run 'sudo groupdel temp'
run 'bash /tmp/lab/check.sh'
