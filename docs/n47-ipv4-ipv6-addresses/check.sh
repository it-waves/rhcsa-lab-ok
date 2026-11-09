#!/usr/bin/env bash
# N47 practice-task checker. Read-only.
fail=0
if ip -4 -br address show dummy1 2>/dev/null | grep -q '10\.20\.30\.40/24'; then echo "PASS: dummy1 has IPv4 10.20.30.40/24"; else echo "FAIL: dummy1 has no IPv4 address 10.20.30.40/24"; fail=1; fi
if ip -6 -br address show dummy1 2>/dev/null | grep -qi 'fd00:20::40/64'; then echo "PASS: dummy1 has IPv6 fd00:20::40/64"; else echo "FAIL: dummy1 has no IPv6 address fd00:20::40/64"; fail=1; fi
if [ "$(nmcli -g connection.autoconnect connection show exam0 2>/dev/null)" = "yes" ]; then echo "PASS: connection exam0 starts automatically"; else echo "FAIL: connection exam0 does not exist or does not start automatically"; fail=1; fi
exit $fail
