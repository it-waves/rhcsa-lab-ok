# Solution

```
sudo systemctl enable --now httpd
sudo systemctl disable --now atd
bash check.sh
```

`enable --now` enables and starts; `disable --now` disables and stops. Without `--now`, only the boot setting changes.
