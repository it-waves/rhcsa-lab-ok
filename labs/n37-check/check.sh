#!/usr/bin/env bash
# N37 practice-task checker. Read-only.
fail=0
src=$(findmnt -n -o SOURCE,FSTYPE /mnt/exam 2>/dev/null)
if [ "$src" = "localhost:/srv/exam nfs4" ] || [ "$src" = "localhost:/srv/exam nfs" ]; then echo "PASS: /mnt/exam is the NFS share localhost:/srv/exam"; else echo "FAIL: /mnt/exam is not mounted from localhost:/srv/exam over NFS"; fail=1; fi
if [ "$(cat /mnt/exam/hello.txt 2>/dev/null)" = "exam ok" ]; then echo "PASS: hello.txt is readable through the mount"; else echo "FAIL: hello.txt is not readable in /mnt/exam"; fail=1; fi
if findmnt -n /mnt/old >/dev/null 2>&1; then echo "FAIL: /mnt/old is still mounted"; fail=1; else echo "PASS: /mnt/old is unmounted"; fi
exit $fail
