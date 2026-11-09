#!/usr/bin/env bash
# N55 practice-task checker. Read-only.
fail=0
if [ "$(sudo firewall-cmd --get-default-zone 2>/dev/null)" = "dmz" ]; then echo "PASS: the default zone is dmz"; else echo "FAIL: the default zone is not dmz"; fail=1; fi
p=" $(sudo firewall-cmd --permanent --zone=public --list-ports 2>/dev/null) "
s=" $(sudo firewall-cmd --permanent --zone=public --list-services 2>/dev/null) "
r=" $(sudo firewall-cmd --zone=public --list-services 2>/dev/null) "
case "$p" in *" 9090/tcp "*) echo "PASS: port 9090/tcp is saved in the zone public";; *) echo "FAIL: port 9090/tcp is not saved in the zone public"; fail=1;; esac
case "$s" in *" https "*) echo "PASS: service https is saved in the zone public";; *) echo "FAIL: service https is not saved in the zone public"; fail=1;; esac
case "$r" in *" https "*) echo "PASS: service https is allowed now in the zone public";; *) echo "FAIL: service https is not allowed now in the zone public"; fail=1;; esac
exit $fail
