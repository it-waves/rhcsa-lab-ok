# Solution

```
sudo mkdir -p /etc/systemd/journald.conf.d
printf '[Journal]\nStorage=persistent\n' | sudo tee /etc/systemd/journald.conf.d/persistent.conf
sudo systemctl restart systemd-journald
bash check.sh
sudo systemctl reboot
```

After the reboot: `bash check.sh` and `sudo journalctl --list-boots`. You can also write the file with `sudo vim /etc/systemd/journald.conf.d/persistent.conf` and type the two lines yourself.
