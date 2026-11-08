#!/usr/bin/env bash
# N33 practice-task checker. Read-only.
fail=0
s=$(sudo lvs --noheadings --units m --nosuffix -o lv_size examvg/examlv 2>/dev/null | tr -d ' ' | cut -d. -f1)
if [ -n "$s" ] && [ "$s" -ge 296 ] && [ "$s" -le 304 ]; then echo "PASS: examlv exists and is about 300 MiB"; else echo "FAIL: examlv is missing or not about 300 MiB"; fail=1; fi
if sudo lvs examvg/oldlv >/dev/null 2>&1; then echo "FAIL: oldlv still exists, delete it"; fail=1; else echo "PASS: oldlv is gone"; fi
exit $fail
