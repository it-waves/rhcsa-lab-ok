# Solution

```
sudo usermod -aG wheel gina
sudo visudo -f /etc/sudoers.d/hank        # type the rule, save, quit
sudo chmod 0440 /etc/sudoers.d/hank
sudo visudo -c
sudo -l -U hank
bash check.sh
```

The rule line for hank:

```
hank ALL=(ALL) NOPASSWD: /usr/bin/systemctl
```

In a lab you may write it with `echo 'hank ALL=(ALL) NOPASSWD: /usr/bin/systemctl' | sudo tee /etc/sudoers.d/hank`.

Clean up: `sudo rm /etc/sudoers.d/hank`, `sudo userdel -r gina`, `sudo userdel -r hank`.
