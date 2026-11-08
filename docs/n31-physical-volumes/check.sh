#!/usr/bin/env bash
# N31 practice-task checker. Read-only.
fail=0
if sudo pvs --noheadings -o pv_name 2>/dev/null | grep -q '/dev/vdc'; then echo "PASS: /dev/vdc is a physical volume"; else echo "FAIL: /dev/vdc is not a physical volume"; fail=1; fi
if sudo pvs --noheadings -o pv_name 2>/dev/null | grep -q '/dev/vdb'; then echo "FAIL: /dev/vdb is still a physical volume, remove it"; fail=1; else echo "PASS: /dev/vdb is not a physical volume"; fi
exit $fail
