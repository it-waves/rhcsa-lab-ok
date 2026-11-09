#!/usr/bin/env bash
# N35 practice-task checker. Read-only.
fail=0
if swapon --show=NAME --noheadings 2>/dev/null | grep -q '/dev/vdc1'; then echo "PASS: /dev/vdc1 is active swap"; else echo "FAIL: /dev/vdc1 is not active swap"; fail=1; fi
if grep -Eq '^(UUID=[0-9a-f-]+|/dev/vdc1)[[:space:]]+none[[:space:]]+swap' /etc/fstab; then echo "PASS: swap is in /etc/fstab"; else echo "FAIL: no swap line for /dev/vdc1 in /etc/fstab"; fail=1; fi
if sudo lvs vgexam/examnew >/dev/null 2>&1; then echo "PASS: logical volume examnew exists"; else echo "FAIL: logical volume examnew is missing"; fail=1; fi
if [ "$(cat /mnt/keep/important.txt 2>/dev/null)" = "customer data" ]; then echo "PASS: the old data is untouched"; else echo "FAIL: the old data in /mnt/keep is damaged"; fail=1; fi
exit $fail
