#!/usr/bin/env bash
# N04 practice-task checker. Read-only. Run on your own lab as the user who did the task.
fail=0
f="$HOME/lab5/remote-host.txt"
if [ -s "$f" ]; then echo "PASS: ~/lab5/remote-host.txt exists and is not empty"; else echo "FAIL: ~/lab5/remote-host.txt missing or empty"; fail=1; fi
if [ -s "$f" ] && [ "$(cat "$f")" = "$(hostname)" ]; then echo "PASS: it holds this machine's hostname, as reported over ssh"; else echo "FAIL: the file should hold exactly the hostname printed by: ssh localhost hostname"; fail=1; fi
exit $fail
