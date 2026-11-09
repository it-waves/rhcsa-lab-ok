# Solution

```
ssh-keygen -t ed25519 -f ~/.ssh/pat_key
ssh-copy-id -i ~/.ssh/pat_key.pub pat@localhost
ssh -i ~/.ssh/pat_key pat@localhost id
bash check.sh
sudo systemctl reboot
```

`ssh-keygen` asks for a passphrase: on a real system, set one. (The lab video uses `-q -N ''` to skip the questions.) `ssh-copy-id` asks for pat's password once. After the reboot: `bash check.sh` again. Every line must say PASS.
