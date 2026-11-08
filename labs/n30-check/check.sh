#!/usr/bin/env bash
# N30 practice-task checker. Read-only.
fail=0
if [ "$(lsblk -dno PTTYPE /dev/vdc 2>/dev/null)" = "gpt" ]; then echo "PASS: /dev/vdc has a GPT label"; else echo "FAIL: /dev/vdc has no GPT label"; fail=1; fi
s=$(lsblk -bno SIZE /dev/vdc1 2>/dev/null)
if [ -n "$s" ] && [ "$s" -ge 520000000 ] && [ "$s" -le 530000000 ]; then echo "PASS: /dev/vdc1 is about 500 MiB"; else echo "FAIL: /dev/vdc1 is missing or not about 500 MiB"; fail=1; fi
if [ -b /dev/vdc2 ]; then echo "FAIL: /dev/vdc2 still exists, delete it"; fail=1; else echo "PASS: there is no second partition"; fi
exit $fail
