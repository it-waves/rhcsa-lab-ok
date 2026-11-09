#!/usr/bin/env bash
# N51 practice-task checker. Read-only.
fail=0
l=$(getent passwd sam)
if [ -n "$l" ]; then echo "PASS: user sam exists"; else echo "FAIL: user sam does not exist"; fail=1; fi
if [ "$(echo "$l" | cut -d: -f3)" = "3001" ]; then echo "PASS: sam has UID 3001"; else echo "FAIL: sam does not have UID 3001"; fail=1; fi
if [ "$(echo "$l" | cut -d: -f5)" = "Sam Smith" ]; then echo "PASS: sam has the comment Sam Smith"; else echo "FAIL: sam does not have the comment Sam Smith"; fail=1; fi
if [ "$(echo "$l" | cut -d: -f7)" = "/usr/sbin/nologin" ]; then echo "PASS: sam has the shell /usr/sbin/nologin"; else echo "FAIL: sam does not have the shell /usr/sbin/nologin"; fail=1; fi
if getent passwd temp >/dev/null; then echo "FAIL: user temp still exists"; fail=1; else echo "PASS: user temp is deleted"; fi
if [ -d /home/temp ]; then echo "FAIL: the home directory /home/temp still exists"; fail=1; else echo "PASS: the home directory /home/temp is deleted"; fi
exit $fail
