# Solution

```
mkdir lab18
vim lab18/who.sh
```

Contents of `who.sh`:

```
#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 name city"
    exit 1
fi
echo "$1 lives in $2"
```

```
chmod +x lab18/who.sh
lab18/who.sh Zed Rome
sudo systemctl reboot
bash check.sh
```
