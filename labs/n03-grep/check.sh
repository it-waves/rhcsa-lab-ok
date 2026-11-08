#!/usr/bin/env bash
# N03 practice-task checker. Read-only. Run on your own lab as the user who did the task.
fail=0
f="$HOME/lab4/errors.txt"
if [ -s "$f" ]; then echo "PASS: ~/lab4/errors.txt exists and is not empty"; else echo "FAIL: ~/lab4/errors.txt missing or empty"; fail=1; fi
if [ -s "$f" ] && [ "$(wc -l < "$f")" -eq 3 ]; then echo "PASS: it holds exactly 3 lines"; else echo "FAIL: expected 3 lines (ERROR twice, error once)"; fail=1; fi
if [ -s "$f" ] && ! grep -qiv 'error' "$f"; then echo "PASS: every line contains error (any case)"; else echo "FAIL: a line without error is in the file"; fail=1; fi
exit $fail
