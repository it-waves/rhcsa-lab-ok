. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install at cronie >/dev/null 2>&1
sudo systemctl enable --now atd crond >/dev/null 2>&1
printf '[Unit]\nDescription=Exam job\n\n[Service]\nType=oneshot\nExecStart=/usr/bin/touch /tmp/exam-timer\n' | sudo tee /etc/systemd/system/exam.service >/dev/null
sudo systemctl daemon-reload
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run "echo '*/15 * * * * /usr/bin/touch /tmp/exam-cron' | crontab -"
run "echo 'touch /tmp/exam-at' | at now + 2 hours"
run "printf '[Unit]\\nDescription=Exam timer\\n\\n[Timer]\\nOnCalendar=*-*-* 03:00:00\\n\\n[Install]\\nWantedBy=timers.target\\n' | sudo tee /etc/systemd/system/exam.timer"
run 'sudo systemctl daemon-reload'
run 'sudo systemctl enable --now exam.timer'
run 'bash /tmp/lab/check.sh'
