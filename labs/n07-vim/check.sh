#!/usr/bin/env bash
# N07 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ -f lab7.txt ]; then echo "PASS: lab7.txt exists"; else echo "FAIL: lab7.txt not found in your home directory"; fail=1; fi
if [ -f lab7.txt ] && [ "$(wc -l < lab7.txt)" -eq 3 ]; then echo "PASS: lab7.txt has three lines"; else echo "FAIL: lab7.txt should have exactly three lines"; fail=1; fi
if [ -f lab7.txt ] && [ "$(cat lab7.txt)" = "$(printf 'alpha\ngamma\ndelta')" ]; then echo "PASS: the lines are alpha, gamma, delta"; else echo "FAIL: expected the lines alpha, gamma, delta in that order"; fail=1; fi
exit $fail
