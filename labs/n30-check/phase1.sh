. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'sudo parted -s /dev/vdc mklabel gpt'
run 'sudo parted -s /dev/vdc mkpart exam1 1MiB 501MiB'
run 'sudo parted -s /dev/vdc mkpart exam2 501MiB 1525MiB'
run 'sudo parted -s /dev/vdc rm 2'
run 'bash /tmp/lab/check.sh'
