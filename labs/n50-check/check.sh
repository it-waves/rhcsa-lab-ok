#!/usr/bin/env bash
# N50 practice-task checker. Read-only.
fail=0
if [ "$(sudo firewall-cmd --state 2>/dev/null)" = "running" ]; then echo "PASS: firewalld is running"; else echo "FAIL: firewalld is not running"; fail=1; fi
svc=" $(sudo firewall-cmd --list-services 2>/dev/null) "
prt=" $(sudo firewall-cmd --list-ports 2>/dev/null) "
case "$svc" in *" https "*) echo "PASS: service https is allowed";; *) echo "FAIL: service https is not allowed"; fail=1;; esac
case "$prt" in *" 5000/tcp "*) echo "PASS: port 5000/tcp is open";; *) echo "FAIL: port 5000/tcp is not open"; fail=1;; esac
case "$svc" in *" dhcpv6-client "*) echo "FAIL: service dhcpv6-client is still allowed"; fail=1;; *) echo "PASS: service dhcpv6-client is not allowed";; esac
if sudo firewall-cmd --permanent --list-services 2>/dev/null | grep -qw https && sudo firewall-cmd --permanent --list-ports 2>/dev/null | grep -qw 5000/tcp; then echo "PASS: the changes are permanent"; else echo "FAIL: the changes are not permanent"; fail=1; fi
exit $fail
