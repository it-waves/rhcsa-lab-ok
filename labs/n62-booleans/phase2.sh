. /tmp/lab/lib.sh
step "After the reboot"
run 'getsebool httpd_enable_homedirs'
step "Back to the default"
run 'sudo setsebool -P httpd_enable_homedirs off'
run 'getsebool httpd_enable_homedirs'
run 'sudo semanage boolean -l -C'
