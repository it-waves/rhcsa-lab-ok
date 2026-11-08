# V00 solution (try the task first)
```
sudo hostnamectl set-hostname node1.lab.example
sudo useradd -m -s /bin/bash labuser
hostnamectl --static
id labuser
sudo systemctl reboot
# after the reboot
hostnamectl --static
id labuser
bash check.sh
```
