# Solution

Read the contexts:

```
ls -Z /etc/shadow
ps -Z -C sshd
```

The type is the third field: `shadow_t` and `sshd_t`. Write them:

```
echo shadow_t > ~/context.txt
echo sshd_t >> ~/context.txt
cat ~/context.txt
bash check.sh
```

Every line must say PASS.
