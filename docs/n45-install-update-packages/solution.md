# Solution

```
sudo dnf install -y tree
dnf download lsof
sudo dnf install -y ./lsof*.rpm
bash check.sh
```

`dnf download` saves the file in the current directory, so run it from your home directory.
