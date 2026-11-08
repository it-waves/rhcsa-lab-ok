. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
while pgrep -x mkfs.erofs >/dev/null || pgrep -x dracut >/dev/null; do sleep 2; done
sleep 5
bg() { printf '[%s@%s ~]$ %s\n' "$(id -un)" "$(hostname -s)" "$1"; ( setsid bash -c "$1" </dev/null >/dev/null 2>&1 & ); echo "# exit=0"; }
step "Start the busy process"
bg 'yes > /dev/null &'
sleep 5
step "Find it and save its PID"
run 'mkdir lab23'
run 'ps aux --sort=-%cpu | head -n 3'
PID=$(pgrep -x yes | head -n 1)
run "echo $PID > lab23/pid.txt"
step "Check before killing"
run 'bash /tmp/lab/check.sh'
step "Kill it"
run "kill $PID"
sleep 1
run 'bash /tmp/lab/check.sh'
