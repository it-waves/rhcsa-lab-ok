#!/usr/bin/env bash
# N28 practice-task checker. Read-only.
fail=0
if systemctl is-active --quiet chronyd; then echo "PASS: chronyd is running"; else echo "FAIL: chronyd is not running"; fail=1; fi
if systemctl is-enabled --quiet chronyd; then echo "PASS: chronyd starts at boot"; else echo "FAIL: chronyd is not enabled at boot"; fail=1; fi
if systemctl is-active --quiet sshd; then echo "PASS: sshd is still running"; else echo "FAIL: sshd is not running"; fail=1; fi
exit $fail
