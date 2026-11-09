#!/usr/bin/env bash
# N48 practice-task checker. Read-only.
fail=0
if getent hosts db1 2>/dev/null | grep -q '^10\.99\.0\.5 '; then echo "PASS: db1 resolves to 10.99.0.5"; else echo "FAIL: db1 does not resolve to 10.99.0.5"; fail=1; fi
if [ "$(nmcli -g ipv4.dns connection show exam1 2>/dev/null)" = "10.99.0.53" ]; then echo "PASS: connection exam1 uses DNS server 10.99.0.53"; else echo "FAIL: connection exam1 missing or DNS server is not 10.99.0.53"; fail=1; fi
if [ "$(nmcli -g connection.autoconnect connection show exam1 2>/dev/null)" = "yes" ]; then echo "PASS: connection exam1 starts automatically"; else echo "FAIL: connection exam1 does not start automatically"; fail=1; fi
exit $fail
