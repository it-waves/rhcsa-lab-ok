#!/usr/bin/env bash
# N32 practice-task checker. Read-only.
fail=0
if sudo vgs --noheadings -o vg_name 2>/dev/null | grep -qw examvg; then echo "PASS: volume group examvg exists"; else echo "FAIL: volume group examvg does not exist"; fail=1; fi
n=$(sudo vgs --noheadings -o pv_count examvg 2>/dev/null | tr -d ' ')
if [ "$n" = "2" ]; then echo "PASS: examvg has 2 physical volumes"; else echo "FAIL: examvg does not have 2 physical volumes"; fail=1; fi
exit $fail
