#!/usr/bin/env bash
# N20 practice-task checker. Read-only. Run as the user who did the task, after the reboot.
fail=0
f="$HOME/lab20/boot.txt"
if [ -f "$f" ]; then echo "PASS: lab20/boot.txt exists"; else echo "FAIL: create lab20/boot.txt"; exit 1; fi
want=$(who -b | sed 's/^ *//')
have=$(sed 's/^ *//' "$f" | head -n 1)
if [ "$have" = "$want" ]; then echo "PASS: boot.txt holds the time of the current boot"; else echo "FAIL: boot.txt should hold the output of who -b, saved after the reboot"; fail=1; fi
if [ "$(systemctl is-system-running)" = "running" ]; then echo "PASS: the system is running normally"; else echo "FAIL: the system is not in the running state"; fail=1; fi
if [ ! -e /run/systemd/shutdown/scheduled ]; then echo "PASS: no shutdown is scheduled"; else echo "FAIL: a shutdown is still scheduled (cancel it with shutdown -c)"; fail=1; fi
exit $fail
