#!/usr/bin/env bash
# V02 practice-task checker. Read-only. Run on your own lab as a user with sudo.
fail=0
if id alice >/dev/null 2>&1; then echo "PASS: user alice exists"; else echo "FAIL: user alice not found"; fail=1; fi
if sudo test -f /home/alice/lab2.txt; then echo "PASS: /home/alice/lab2.txt exists"; else echo "FAIL: /home/alice/lab2.txt not found"; fail=1; fi
owner=$(sudo stat -c %U /home/alice/lab2.txt 2>/dev/null)
if [ "$owner" = "alice" ]; then echo "PASS: lab2.txt is owned by alice"; else echo "FAIL: lab2.txt owner is '${owner:-none}', expected alice"; fail=1; fi
exit $fail
