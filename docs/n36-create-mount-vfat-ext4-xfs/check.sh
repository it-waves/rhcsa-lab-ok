#!/usr/bin/env bash
# N36 practice-task checker. Read-only.
fail=0
t=$(lsblk -no FSTYPE /dev/vdb1 2>/dev/null)
if [ "$t" = xfs ]; then echo "PASS: /dev/vdb1 is XFS"; else echo "FAIL: /dev/vdb1 is not XFS"; fail=1; fi
t=$(lsblk -no FSTYPE /dev/vdb2 2>/dev/null)
if [ "$t" = vfat ]; then echo "PASS: /dev/vdb2 is VFAT"; else echo "FAIL: /dev/vdb2 is not VFAT"; fail=1; fi
if findmnt -n /mnt/data1 >/dev/null 2>&1; then echo "PASS: /mnt/data1 is mounted"; else echo "FAIL: /mnt/data1 is not mounted"; fail=1; fi
if [ "$(cat /mnt/data1/ok.txt 2>/dev/null)" = exam ]; then echo "PASS: ok.txt is in /mnt/data1"; else echo "FAIL: /mnt/data1/ok.txt is missing"; fail=1; fi
if findmnt -n /mnt/data2 >/dev/null 2>&1; then echo "FAIL: /mnt/data2 is still mounted"; fail=1; else echo "PASS: /mnt/data2 is unmounted"; fi
exit $fail
