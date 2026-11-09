# Solution

```
sudo useradd -u 3001 -c "Sam Smith" sam
sudo usermod -s /usr/sbin/nologin sam
sudo userdel -r temp
getent passwd sam
bash check.sh
```

Clean up: `sudo userdel -r sam`.
