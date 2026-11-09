. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo nmcli connection delete exam0 >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo nmcli connection add type dummy ifname dummy1 con-name exam0'
run 'sudo nmcli connection modify exam0 ipv4.method manual ipv4.addresses 10.20.30.40/24'
run 'sudo nmcli connection modify exam0 ipv6.method manual ipv6.addresses fd00:20::40/64'
run 'sudo nmcli connection up exam0'
run 'bash /tmp/lab/check.sh'
