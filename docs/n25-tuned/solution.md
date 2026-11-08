# Solution

```
sudo dnf install -y tuned
sudo systemctl enable --now tuned
sudo tuned-adm profile powersave
sudo systemctl reboot
```

After the reboot:

```
tuned-adm active
bash check.sh
```
