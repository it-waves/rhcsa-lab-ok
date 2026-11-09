#!/usr/bin/env bash
# N44 practice-task checker. Read-only.
fail=0
if grep -Eq '^server +ntp\.lab\.example( .*)? *iburst' /etc/chrony.conf 2>/dev/null; then echo "PASS: chrony.conf has: server ntp.lab.example iburst"; else echo "FAIL: chrony.conf has no 'server ntp.lab.example iburst' line"; fail=1; fi
if systemctl is-enabled chronyd >/dev/null 2>&1; then echo "PASS: chronyd is enabled at boot"; else echo "FAIL: chronyd is not enabled at boot"; fail=1; fi
if systemctl is-active chronyd >/dev/null 2>&1; then echo "PASS: chronyd is running"; else echo "FAIL: chronyd is not running"; fail=1; fi
exit $fail
