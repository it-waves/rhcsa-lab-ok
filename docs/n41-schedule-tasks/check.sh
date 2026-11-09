#!/usr/bin/env bash
# N41 practice-task checker. Read-only.
fail=0
if crontab -l 2>/dev/null | grep -Eq '^\*/15 \* \* \* \* .*touch /tmp/exam-cron'; then echo "PASS: cron runs touch /tmp/exam-cron every 15 minutes"; else echo "FAIL: no every-15-minutes cron job for /tmp/exam-cron"; fail=1; fi
if [ -n "$(atq 2>/dev/null)" ]; then echo "PASS: an at job is waiting"; else echo "FAIL: no at job is waiting"; fail=1; fi
if systemctl is-enabled exam.timer >/dev/null 2>&1 && systemctl is-active exam.timer >/dev/null 2>&1; then echo "PASS: exam.timer is enabled and active"; else echo "FAIL: exam.timer is not enabled and active"; fail=1; fi
if systemctl show exam.timer -p TimersCalendar 2>/dev/null | grep -q '03:00:00'; then echo "PASS: exam.timer runs daily at 03:00"; else echo "FAIL: exam.timer is not set to 03:00 daily"; fail=1; fi
exit $fail
