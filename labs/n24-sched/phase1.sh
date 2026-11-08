. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
while pgrep -x mkfs.erofs >/dev/null || pgrep -x dracut >/dev/null; do sleep 2; done
sleep 5
bg() { printf "[%s@%s ~]$ %s\n" "$(id -un)" "$(hostname -s)" "$1"; ( setsid bash -c "$1" </dev/null >/dev/null 2>&1 & ); echo "# exit=0"; }
step "1. What is the niceness?"
run 'nice'
run 'nice -n 10 nice'
step "2. Four busy processes, two of them nice"
bg 'yes > /dev/null &'
bg 'yes > /dev/null &'
bg 'nice -n 19 yes > /dev/null &'
bg 'nice -n 19 yes > /dev/null &'
sleep 12
step "3. See the niceness"
run 'ps -eo pid,ni,%cpu,comm --sort=-%cpu | head -n 6'
step "4. Change it while it runs"
P1=$(pgrep -x yes | sed -n 1p)
P3=$(pgrep -x yes | sed -n 3p)
run "renice -n 19 -p $P1"
run "ps -o pid,ni,comm -p $P1"
step "5. Lower the number"
run "renice -n -5 -p $P3"
srun "renice -n -5 -p $P3"
run "ps -o pid,ni,comm -p $P3"
step "6. Stop them"
run 'pkill yes'
step "7. A nice process and a reboot"
bg 'nice -n 10 sleep 3000 &'
run 'ps -C sleep -o pid,ni,comm'
