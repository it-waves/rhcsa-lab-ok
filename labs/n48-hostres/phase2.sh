. /tmp/lab/lib.sh
step "After the reboot"
run 'getent hosts web1'
run 'nmcli -f ipv4.dns connection show lab1'
