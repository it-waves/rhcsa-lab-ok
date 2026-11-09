#!/usr/bin/env bash
# N56 practice-task checker. Read-only.
fail=0
if sudo grep -qE '^umask 077$' /home/ivan/.bashrc 2>/dev/null; then echo "PASS: /home/ivan/.bashrc has the line umask 077"; else echo "FAIL: /home/ivan/.bashrc has no line umask 077"; fail=1; fi
u=$(sudo -u ivan bash -ic umask 2>/dev/null | tail -n 1)
if [ "$u" = "0077" ]; then echo "PASS: ivan's umask is 0077"; else echo "FAIL: ivan's umask is ${u:-unknown}, not 0077"; fail=1; fi
exit $fail
