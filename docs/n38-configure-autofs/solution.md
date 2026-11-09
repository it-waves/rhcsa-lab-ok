# Solution

```
echo "/remote /etc/auto.remote" | sudo tee /etc/auto.master.d/remote.autofs
echo "exam -fstype=nfs4,rw 127.0.0.2:/srv/exam" | sudo tee /etc/auto.remote
sudo systemctl enable --now autofs
cat /remote/exam/hello.txt
bash check.sh
```
