# Solution

```
sudo lvcreate -n examlv -L 300M examvg
sudo lvremove -y examvg/oldlv
bash check.sh
```

`sudo lvs` shows the result at any step.
