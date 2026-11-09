. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. The current mode"
run 'getenforce'
run "grep '^SELINUX=' /etc/selinux/config"
run 'sestatus'
step "2. Change the mode until the next reboot"
run 'sudo setenforce 0'
run 'getenforce'
run 'sudo setenforce 1'
run 'getenforce'
step "3. Change the mode for the next boot"
run "sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config"
run "grep '^SELINUX=' /etc/selinux/config"
run 'getenforce'
