. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo nmcli connection delete lab1 >/dev/null 2>&1
sudo sed -i '/web1/d' /etc/hosts
step "1. Where does a name get looked up?"
run "grep '^hosts' /etc/nsswitch.conf"
step "2. The local file"
run 'cat /etc/hosts'
run 'getent hosts web1'
step "3. Add a name"
run "echo '192.168.50.20 web1.lab.test web1' | sudo tee -a /etc/hosts"
run 'getent hosts web1'
step "4. DNS server"
run 'cat /etc/resolv.conf'
run 'sudo nmcli connection add type dummy ifname dummy2 con-name lab1'
run 'sudo nmcli connection modify lab1 ipv4.method manual ipv4.addresses 192.168.51.10/24'
run 'sudo nmcli connection modify lab1 ipv4.dns 192.168.51.53'
run 'sudo nmcli connection up lab1'
run 'nmcli -f ipv4.dns connection show lab1'
