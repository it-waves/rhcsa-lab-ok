# Solution

```
echo 'umask 077' | sudo tee -a /home/ivan/.bashrc
bash check.sh
sudo systemctl reboot
```

After the reboot: `bash check.sh` again. Every line must say PASS.
Appending with `tee -a` keeps the file owned by `ivan`.
