# Solution

```
echo '*/15 * * * * /usr/bin/touch /tmp/exam-cron' | crontab -
echo 'touch /tmp/exam-at' | at now + 2 hours
printf '[Unit]\nDescription=Exam timer\n\n[Timer]\nOnCalendar=*-*-* 03:00:00\n\n[Install]\nWantedBy=timers.target\n' | sudo tee /etc/systemd/system/exam.timer
sudo systemctl daemon-reload
sudo systemctl enable --now exam.timer
bash check.sh
```

`crontab -` replaces the whole table. To add a line to an existing table, use `crontab -e`.
