#!/usr/bin/env bash
# N34 practice-task checker. Read-only.
fail=0
if grep -Eq '^(LABEL=examlabel|UUID=[0-9a-f-]+)[[:space:]]+/mnt/exam[[:space:]]' /etc/fstab; then echo "PASS: /etc/fstab has a LABEL or UUID line for /mnt/exam"; else echo "FAIL: no LABEL= or UUID= line for /mnt/exam in /etc/fstab"; fail=1; fi
if findmnt -n /mnt/exam >/dev/null 2>&1; then echo "PASS: /mnt/exam is mounted"; else echo "FAIL: /mnt/exam is not mounted"; fail=1; fi
exit $fail
