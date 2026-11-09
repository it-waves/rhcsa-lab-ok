#!/usr/bin/env bash
# N52 practice-task checker. Read-only.
fail=0
s=$(sudo getent shadow dave)
h=$(echo "$s" | cut -d: -f2); l=$(echo "$s" | cut -d: -f3); mn=$(echo "$s" | cut -d: -f4); mx=$(echo "$s" | cut -d: -f5); w=$(echo "$s" | cut -d: -f6)
case "$h" in '$'*) echo "PASS: dave has a password";; *) echo "FAIL: dave has no password"; fail=1;; esac
if [ "$mn" = "2" ]; then echo "PASS: minimum days is 2"; else echo "FAIL: minimum days is not 2"; fail=1; fi
if [ "$mx" = "60" ]; then echo "PASS: maximum days is 60"; else echo "FAIL: maximum days is not 60"; fail=1; fi
if [ "$w" = "10" ]; then echo "PASS: warning days is 10"; else echo "FAIL: warning days is not 10"; fail=1; fi
if [ "$l" = "0" ]; then echo "PASS: dave must change the password at next login"; else echo "FAIL: dave is not forced to change the password"; fail=1; fi
exit $fail
