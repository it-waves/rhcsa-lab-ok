#!/usr/bin/env bash
# N23 practice-task checker. Read-only. Run as the user who did the task.
fail=0
f="$HOME/lab23/pid.txt"
if [ -f "$f" ] && [[ "$(head -n 1 "$f")" =~ ^[0-9]+$ ]]; then pid=$(head -n 1 "$f"); echo "PASS: lab23/pid.txt holds a PID ($pid)"
else echo "FAIL: lab23/pid.txt should hold one PID number"; exit 1; fi
if kill -0 "$pid" 2>/dev/null; then echo "FAIL: process $pid is still running, kill it"; fail=1; else echo "PASS: process $pid is gone"; fi
if pgrep -u "$(id -u)" -x yes >/dev/null; then echo "FAIL: a yes process is still running"; fail=1; else echo "PASS: no yes process is running"; fi
exit $fail
