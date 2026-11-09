#!/usr/bin/env bash
# N38 practice-task checker. Reading hello.txt triggers the automount.
fail=0
if systemctl is-enabled autofs >/dev/null 2>&1; then echo "PASS: autofs is enabled"; else echo "FAIL: autofs is not enabled"; fail=1; fi
if systemctl is-active autofs >/dev/null 2>&1; then echo "PASS: autofs is running"; else echo "FAIL: autofs is not running"; fail=1; fi
if [ "$(cat /remote/exam/hello.txt 2>/dev/null)" = "exam ok" ]; then echo "PASS: /remote/exam/hello.txt is readable through autofs"; else echo "FAIL: /remote/exam/hello.txt is not readable"; fail=1; fi
src=$(findmnt -n -o SOURCE /remote/exam 2>/dev/null)
if [ "$src" = "localhost:/srv/exam" ]; then echo "PASS: /remote/exam is the share localhost:/srv/exam"; else echo "FAIL: /remote/exam is not mounted from localhost:/srv/exam"; fail=1; fi
exit $fail
