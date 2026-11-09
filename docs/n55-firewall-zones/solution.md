# Solution

```
sudo firewall-cmd --zone=public --add-port=9090/tcp
sudo firewall-cmd --zone=public --add-service=https
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --set-default-zone=dmz
bash check.sh
sudo systemctl reboot
```

After the reboot: `bash check.sh` again. Every line must say PASS.
