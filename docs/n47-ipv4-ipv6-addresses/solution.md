# Solution

```
sudo nmcli connection add type dummy ifname dummy1 con-name exam0
sudo nmcli connection modify exam0 ipv4.method manual ipv4.addresses 10.20.30.40/24
sudo nmcli connection modify exam0 ipv6.method manual ipv6.addresses fd00:20::40/64
sudo nmcli connection up exam0
ip -br address show dummy1
bash check.sh
```

Clean up: `sudo nmcli connection delete exam0`
