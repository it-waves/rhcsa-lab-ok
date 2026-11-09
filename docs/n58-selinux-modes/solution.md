# Solution

```
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
bash check.sh
sudo systemctl reboot
```

After the reboot: `bash check.sh` again. Every line must say PASS.

Put it back when you are done:

```
sudo sed -i 's/^SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
sudo setenforce 1
getenforce
```
