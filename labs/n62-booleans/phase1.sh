. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. List booleans"
run 'getsebool httpd_enable_homedirs'
run 'getsebool -a | grep httpd_enable'
run "sudo semanage boolean -l | grep '^httpd_enable_homedirs'"
step "2. Change it until the next reboot"
run 'sudo setsebool httpd_enable_homedirs on'
run 'getsebool httpd_enable_homedirs'
run "sudo semanage boolean -l | grep '^httpd_enable_homedirs'"
step "3. Change it for good"
run 'sudo setsebool -P httpd_enable_homedirs on'
run "sudo semanage boolean -l | grep '^httpd_enable_homedirs'"
run 'sudo semanage boolean -l -C'
