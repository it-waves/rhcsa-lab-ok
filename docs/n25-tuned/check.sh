#!/usr/bin/env bash
# N25 practice-task checker. Read-only.
fail=0
if systemctl is-active --quiet tuned; then echo "PASS: tuned is running"; else echo "FAIL: tuned is not running (systemctl enable --now tuned)"; fail=1; fi
if systemctl is-enabled --quiet tuned 2>/dev/null; then echo "PASS: tuned starts at boot"; else echo "FAIL: tuned is not enabled at boot"; fail=1; fi
p=$(tuned-adm active 2>/dev/null | sed 's/^Current active profile: //')
if [ "$p" = "powersave" ]; then echo "PASS: active profile is powersave"; else echo "FAIL: active profile is '$p', it should be powersave"; fail=1; fi
exit $fail
