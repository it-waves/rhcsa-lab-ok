. /tmp/lab/lib.sh
step "After the reboot"
run 'mkdir lab21'
run 'systemctl is-active graphical.target > lab21/target.txt'
run 'bash /tmp/lab/check.sh'
run 'sudo grubby --update-kernel=ALL --remove-args=systemd.unit=graphical.target'
run 'bash /tmp/lab/check.sh'
