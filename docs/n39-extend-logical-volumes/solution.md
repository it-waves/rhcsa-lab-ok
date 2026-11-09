# Solution

```
sudo pvcreate /dev/vdc
sudo vgextend vgexam /dev/vdc
sudo lvextend -r -L 2G /dev/vgexam/lvexam
bash check.sh
```
