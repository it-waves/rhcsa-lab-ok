# Solution

`dnf provides /usr/bin/telnet` shows a line starting `telnet-1:0.17-...`: the package name is `telnet` (the part before the version).

```
mkdir lab13
dnf provides /usr/bin/telnet
echo "telnet" > lab13/answer.txt
sudo dnf -y install telnet
sudo dnf -y install tree
sudo dnf -y remove tree
```

Check:

```
rpm -q telnet
rpm -q tree
```

Expected: telnet is installed, and `rpm -q tree` says `package tree is not installed`.
