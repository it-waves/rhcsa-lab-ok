# Solution

```
sudo groupadd -g 4000 ops
sudo usermod -aG ops erin
sudo usermod -aG ops frank
sudo groupdel temp
getent group ops
bash check.sh
```

Clean up: `sudo userdel -r erin`, `sudo userdel -r frank`, `sudo groupdel ops`.
