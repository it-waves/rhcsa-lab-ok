. /tmp/lab/lib.sh
bg() { printf '[%s@%s ~]$ %s\n' "$(id -un)" "$(hostname -s)" "$1"; ( setsid bash -c "$1" </dev/null >/dev/null 2>&1 & ); echo "# exit=0"; }
step "Start the two processes"
bg 'sleep 600 &'
bg 'nice -n 5 sleep 601 &'
step "Check before renice"
run 'bash /tmp/lab/check.sh'
step "Renice and check"
P=$(pgrep -f 'sleep 600' | head -n 1)
run "renice -n 10 -p $P"
run 'bash /tmp/lab/check.sh'
