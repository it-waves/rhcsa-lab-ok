# Solution

```
echo '10.99.0.5 db1.exam.test db1' | sudo tee -a /etc/hosts
sudo nmcli connection add type dummy ifname dummy3 con-name exam1
sudo nmcli connection modify exam1 ipv4.method manual ipv4.addresses 10.99.0.10/24
sudo nmcli connection modify exam1 ipv4.dns 10.99.0.53
sudo nmcli connection up exam1
getent hosts db1
bash check.sh
```

Clean up: `sudo sed -i '/db1/d' /etc/hosts` and `sudo nmcli connection delete exam1`
