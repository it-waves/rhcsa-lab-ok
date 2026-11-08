# Solution

```
sudo vgcreate examvg /dev/vdb
sudo vgextend examvg /dev/vdc
bash check.sh
```

`sudo vgs` and `sudo pvs` show the result at any step.
