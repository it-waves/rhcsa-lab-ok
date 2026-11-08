#!/usr/bin/env bash
# N02 practice-task checker. Read-only. Run on your own lab as the user who did the task.
fail=0
if [ -s "$HOME/lab3/ok.txt" ] && grep -q '^/etc/hostname$' "$HOME/lab3/ok.txt"; then echo "PASS: ~/lab3/ok.txt holds the normal output"; else echo "FAIL: ~/lab3/ok.txt missing or wrong"; fail=1; fi
if [ -s "$HOME/lab3/err.txt" ] && grep -q 'nonexistent' "$HOME/lab3/err.txt"; then echo "PASS: ~/lab3/err.txt holds the error message"; else echo "FAIL: ~/lab3/err.txt missing or wrong"; fail=1; fi
if ! grep -q 'nonexistent' "$HOME/lab3/ok.txt" 2>/dev/null; then echo "PASS: errors were kept out of ok.txt"; else echo "FAIL: ok.txt contains the error"; fail=1; fi
exit $fail
