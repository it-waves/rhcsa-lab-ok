# Solution

```
echo 'server ntp.lab.example iburst' | sudo tee -a /etc/chrony.conf
sudo systemctl enable --now chronyd
bash check.sh
```

On an already running chronyd, add `sudo systemctl restart chronyd` so it reads the new line. To edit the file by hand, use `sudo vim /etc/chrony.conf`.
