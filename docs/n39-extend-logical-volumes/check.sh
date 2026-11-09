#!/usr/bin/env bash
# N39 practice-task checker. Read-only.
fail=0
lv=$(sudo lvs --noheadings --units m --nosuffix -o lv_size vgexam/lvexam 2>/dev/null | tr -d ' ' | cut -d. -f1)
if [ -n "$lv" ] && [ "$lv" -ge 1900 ]; then echo "PASS: lvexam is at least 2G"; else echo "FAIL: lvexam is not 2G yet"; fail=1; fi
fs=$(df -B1M --output=size /mnt/exam 2>/dev/null | tail -1 | tr -d ' ')
if [ -n "$fs" ] && [ "$fs" -ge 1850 ]; then echo "PASS: the file system on /mnt/exam is about 2G"; else echo "FAIL: the file system on /mnt/exam is still small"; fail=1; fi
if [ "$(cat /mnt/exam/hello.txt 2>/dev/null)" = "exam ok" ]; then echo "PASS: the data in hello.txt is intact"; else echo "FAIL: hello.txt is missing or changed"; fail=1; fi
exit $fail
