#!/usr/bin/env bash
# N42 practice-task checker. Read-only.
fail=0
if systemctl is-enabled httpd >/dev/null 2>&1; then echo "PASS: httpd is enabled at boot"; else echo "FAIL: httpd is not enabled at boot"; fail=1; fi
if systemctl is-active httpd >/dev/null 2>&1; then echo "PASS: httpd is running"; else echo "FAIL: httpd is not running"; fail=1; fi
if ! systemctl is-enabled atd >/dev/null 2>&1; then echo "PASS: atd is disabled"; else echo "FAIL: atd is still enabled"; fail=1; fi
if ! systemctl is-active atd >/dev/null 2>&1; then echo "PASS: atd is stopped"; else echo "FAIL: atd is still running"; fail=1; fi
exit $fail
