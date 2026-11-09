. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo nmcli connection delete exam1 >/dev/null 2>&1
sudo sed -i '/db1/d' /etc/hosts
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "echo '10.99.0.5 db1.exam.test db1' | sudo tee -a /etc/hosts"
run 'sudo nmcli connection add type dummy ifname dummy3 con-name exam1'
run 'sudo nmcli connection modify exam1 ipv4.method manual ipv4.addresses 10.99.0.10/24'
run 'sudo nmcli connection modify exam1 ipv4.dns 10.99.0.53'
run 'sudo nmcli connection up exam1'
run 'bash /tmp/lab/check.sh'
