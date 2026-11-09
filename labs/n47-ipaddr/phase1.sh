. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo nmcli connection delete lab0 >/dev/null 2>&1
step "1. Which addresses exist?"
run 'ip -br address'
step "2. Create a connection"
run 'sudo nmcli connection add type dummy ifname dummy0 con-name lab0'
step "3. Add a static IPv4 and IPv6 address"
run 'sudo nmcli connection modify lab0 ipv4.method manual ipv4.addresses 192.168.50.10/24'
run 'sudo nmcli connection modify lab0 ipv6.method manual ipv6.addresses fd00:50::10/64'
run 'sudo nmcli connection up lab0'
step "4. Check the result"
run 'ip -br address show dummy0'
run 'nmcli -f ipv4.method,ipv4.addresses,ipv6.method,ipv6.addresses connection show lab0'
