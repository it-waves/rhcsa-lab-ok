. /tmp/lab/lib.sh
step "After the reboot"
run 'getenforce'
run 'sestatus | grep mode'
step "Back to enforcing"
run "sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config"
run 'sudo setenforce 1'
run 'getenforce'
run "grep '^SELINUX=' /etc/selinux/config"
