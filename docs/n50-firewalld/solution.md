# Solution

```
sudo systemctl enable --now firewalld
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --permanent --add-port=5000/tcp
sudo firewall-cmd --permanent --remove-service=dhcpv6-client
sudo firewall-cmd --reload
sudo firewall-cmd --list-services
sudo firewall-cmd --list-ports
bash check.sh
```

Clean up: `--permanent --remove-service=https`, `--permanent --remove-port=5000/tcp`, `--permanent --add-service=dhcpv6-client`, then `--reload`.
