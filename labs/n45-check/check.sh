#!/usr/bin/env bash
# N45 practice-task checker. Read-only.
fail=0
if rpm -q zip >/dev/null 2>&1; then echo "PASS: zip is installed"; else echo "FAIL: zip is not installed"; fail=1; fi
if rpm -q unzip >/dev/null 2>&1; then echo "PASS: unzip is installed"; else echo "FAIL: unzip is not installed"; fail=1; fi
if ls ~/*.rpm >/dev/null 2>&1; then echo "PASS: an rpm file is in the home directory"; else echo "FAIL: no rpm file in the home directory"; fail=1; fi
exit $fail
