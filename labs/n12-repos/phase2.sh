. /tmp/lab/lib.sh
step "Reboot check"
run 'dnf repolist'
run 'ls /etc/yum.repos.d'
