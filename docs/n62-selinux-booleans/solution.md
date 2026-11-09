# Solution

```
getsebool httpd_can_network_connect
sudo setsebool -P httpd_can_network_connect on
bash check.sh
sudo systemctl reboot
```

After the reboot: `bash check.sh` again. Both lines must say PASS.

Without `-P` the first check passes, but the second one (saved settings) fails and the value is lost at the reboot.

When you are done on your own system, put it back: `sudo setsebool -P httpd_can_network_connect off`.
