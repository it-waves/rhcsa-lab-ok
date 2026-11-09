. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install at cronie >/dev/null 2>&1
sudo systemctl enable --now atd crond >/dev/null 2>&1
step "1. at: run once, later"
run 'echo "date > /tmp/at.log" | at now + 1 minute'
run 'atq'
step "2. cron: run on a schedule"
run 'echo "* * * * * date >> /tmp/cron.log" | crontab -'
run 'crontab -l'
step "3. systemd timer: a service plus a timer"
run "printf '[Unit]\\nDescription=Say hello\\n\\n[Service]\\nType=oneshot\\nExecStart=/usr/bin/bash -c \"date >> /tmp/timer.log\"\\n' | sudo tee /etc/systemd/system/hello.service"
run "printf '[Unit]\\nDescription=Run hello every minute\\n\\n[Timer]\\nOnCalendar=minutely\\n\\n[Install]\\nWantedBy=timers.target\\n' | sudo tee /etc/systemd/system/hello.timer"
run 'sudo systemctl daemon-reload'
run 'sudo systemctl enable --now hello.timer'
run 'systemctl list-timers hello.timer --no-pager'
step "4. Wait a minute, then look"
run 'sleep 75'
run 'cat /tmp/at.log'
run 'cat /tmp/cron.log'
run 'cat /tmp/timer.log'
run 'atq'
