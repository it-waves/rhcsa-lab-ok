#!/usr/bin/env bash
# N24 practice-task checker. Read-only. Run as the user who did the task.
fail=0
ni() { ps -u "$(id -u)" -o ni=,args= | awk -v c="$1" '$0 ~ ("^ *-?[0-9]+ " c "$") {print $1; exit}'; }
a=$(ni "sleep 600"); b=$(ni "sleep 601")
if [ -z "$a" ]; then echo "FAIL: no process 'sleep 600' is running"; fail=1
elif [ "$a" = "10" ]; then echo "PASS: sleep 600 has niceness 10"; else echo "FAIL: sleep 600 has niceness $a, it should be 10 (renice)"; fail=1; fi
if [ -z "$b" ]; then echo "FAIL: no process 'sleep 601' is running"; fail=1
elif [ "$b" = "5" ]; then echo "PASS: sleep 601 was started with niceness 5"; else echo "FAIL: sleep 601 has niceness $b, it should be 5 (nice -n 5)"; fail=1; fi
exit $fail
