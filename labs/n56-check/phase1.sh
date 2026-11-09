. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo useradd ivan >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "echo 'umask 077' | sudo tee -a /home/ivan/.bashrc"
run 'bash /tmp/lab/check.sh'
