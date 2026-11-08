# Solution

```
logger -t ex200 "practice message"
sudo journalctl -t ex200 --no-pager > ~/ex200.log
bash check.sh
sudo systemctl reboot
```

After the reboot, run `bash check.sh` again. `cat ~/ex200.log` shows what was saved.
