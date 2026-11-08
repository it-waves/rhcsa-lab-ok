# Solution

```
mkdir lab19
vim lab19/report.sh
```

Contents of `report.sh`:

```
#!/bin/bash
host=$(hostname -s)
accounts=$(wc -l < /etc/passwd)
echo "Host: $host"
echo "Accounts: $accounts"
```

```
chmod +x lab19/report.sh
lab19/report.sh
sudo systemctl reboot
bash check.sh
```

`wc -l < /etc/passwd` reads the file from standard input, so it prints only the number (no file name).
