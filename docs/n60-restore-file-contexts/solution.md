# Solution

```
ls -Z /etc/practice.conf
sudo restorecon -v /etc/practice.conf
ls -Z /etc/practice.conf
bash check.sh
```

The type changes from `user_home_t` to `etc_t`, and the checker says PASS.

When you are done on your own system, remove the practice file: `sudo rm /etc/practice.conf`.
