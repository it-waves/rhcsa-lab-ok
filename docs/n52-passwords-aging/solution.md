# Solution

```
sudo passwd dave          # type a password twice (in a lab you may use: echo "Linux#2026" | sudo passwd --stdin dave)
sudo chage -m 2 dave
sudo chage -M 60 dave
sudo chage -W 10 dave
sudo passwd -e dave
sudo chage -l dave
bash check.sh
```

Clean up: `sudo userdel -r dave`.
