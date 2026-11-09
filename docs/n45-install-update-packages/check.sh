#!/usr/bin/env bash
# N45 practice-task checker. Read-only.
fail=0
if rpm -q tree >/dev/null 2>&1; then echo "PASS: tree is installed"; else echo "FAIL: tree is not installed"; fail=1; fi
if rpm -q lsof >/dev/null 2>&1; then echo "PASS: lsof is installed"; else echo "FAIL: lsof is not installed"; fail=1; fi
if ls ~/lsof*.rpm >/dev/null 2>&1; then echo "PASS: the lsof rpm file is in the home directory"; else echo "FAIL: no lsof rpm file in the home directory"; fail=1; fi
exit $fail
