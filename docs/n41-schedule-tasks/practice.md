# Practice task: at, cron and a systemd timer

Work as `student`.

**Setup (once).**

```
sudo dnf -y install at cronie
sudo systemctl enable --now atd crond
printf '[Unit]\nDescription=Exam job\n\n[Service]\nType=oneshot\nExecStart=/usr/bin/touch /tmp/exam-timer\n' | sudo tee /etc/systemd/system/exam.service
sudo systemctl daemon-reload
```

**Task.**

1. Create a cron job for `student` that runs `/usr/bin/touch /tmp/exam-cron` every 15 minutes.
2. Schedule an `at` job that runs `touch /tmp/exam-at` in 2 hours.
3. Create `exam.timer` for the existing `exam.service`, running every day at 03:00. Enable it and start it.
4. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
