. /tmp/lab/lib.sh
step "probe"
run 'systemctl is-enabled NetworkManager sshd firewalld cockpit.socket rpcbind chronyd httpd nftables'
run 'systemctl is-active NetworkManager sshd firewalld cockpit.socket'
run 'rpm -q firewalld httpd cockpit-ws nginx'
run 'systemctl list-unit-files --type=service --state=disabled | head -30'
