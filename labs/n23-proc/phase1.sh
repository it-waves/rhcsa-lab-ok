. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
while pgrep -x mkfs.erofs >/dev/null || pgrep -x dracut >/dev/null; do sleep 2; done
sleep 5
# bg: show the command like a terminal would, but start it detached so the capture does not wait for it.
bg() { printf '[%s@%s ~]$ %s\n' "$(id -un)" "$(hostname -s)" "$1"; ( setsid bash -c "$1" </dev/null >/dev/null 2>&1 & ); echo "# exit=0"; }
cat > memhog.py <<'EOT'
a = bytearray(b'x') * 300000000
import time
time.sleep(900)
EOT
step "1. Start busy processes"
run 'cat memhog.py'
bg 'yes > /dev/null &'
bg 'yes > /dev/null &'
bg 'python3 memhog.py &'
sleep 8
step "2. Find the CPU hog"
run 'ps aux --sort=-%cpu | head -n 4'
run 'top -b -n 1 | head -n 12'
step "3. Find the memory hog"
run 'ps aux --sort=-%mem | head -n 4'
step "4. Choose the columns"
run 'ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 4'
step "5. Kill them"
YP=$(pgrep -x yes | head -n 1)
MP=$(pgrep -f memhog.py | head -n 1)
run 'pgrep -x yes'
run "kill $YP"
sleep 1
run "ps -p $YP"
run 'pkill yes'
sleep 1
run 'pgrep -x yes'
run "kill -9 $MP"
sleep 1
run "ps -p $MP"
step "6. Check the top of the list again"
run 'ps aux --sort=-%cpu | head -n 3'
step "7. A process that will not survive a reboot"
bg 'sleep 3000 &'
run 'pgrep -x sleep'
