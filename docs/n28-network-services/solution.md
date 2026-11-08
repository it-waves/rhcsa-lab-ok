# Solution

```
sudo systemctl disable --now chronyd
bash check.sh
sudo systemctl enable --now chronyd
bash check.sh
sudo systemctl reboot
```

After the reboot run `bash check.sh` again. `systemctl status chronyd --no-pager | head -n 3` shows the same facts in full.
