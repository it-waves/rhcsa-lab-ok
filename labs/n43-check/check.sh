#!/usr/bin/env bash
# N43 practice-task checker. Read-only.
fail=0
if [ "$(systemctl get-default 2>/dev/null)" = "multi-user.target" ]; then echo "PASS: default target is multi-user.target"; else echo "FAIL: default target is not multi-user.target"; fail=1; fi
if [ "$(readlink /etc/systemd/system/default.target)" = "/usr/lib/systemd/system/multi-user.target" ]; then echo "PASS: default.target links to multi-user.target"; else echo "FAIL: default.target does not link to multi-user.target"; fail=1; fi
exit $fail
