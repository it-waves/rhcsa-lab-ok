#!/usr/bin/env bash
# N29 practice-task checker. Read-only.
fail=0
if cmp -s "$HOME/exam.txt" /tmp/exam-copy.txt; then echo "PASS: /tmp/exam-copy.txt matches exam.txt"; else echo "FAIL: /tmp/exam-copy.txt is missing or different from exam.txt"; fail=1; fi
if [ -d /tmp/docs-backup ] && diff -r "$HOME/docs" /tmp/docs-backup >/dev/null 2>&1; then echo "PASS: /tmp/docs-backup matches docs"; else echo "FAIL: /tmp/docs-backup is missing or different from docs"; fail=1; fi
exit $fail
