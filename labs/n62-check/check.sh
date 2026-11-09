#!/usr/bin/env bash
# N62 practice-task checker. Read-only.
fail=0
if [ "$(getsebool httpd_can_network_connect | awk '{print $3}')" = "on" ]; then echo "PASS: httpd_can_network_connect is on now"; else echo "FAIL: httpd_can_network_connect is not on now"; fail=1; fi
if sudo semanage boolean -l | grep '^httpd_can_network_connect ' | grep -q '(on *, *on)'; then echo "PASS: it is on in the saved settings too (-P)"; else echo "FAIL: it is not saved for the next boot (use -P)"; fail=1; fi
exit $fail
