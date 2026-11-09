#!/usr/bin/env bash
# N49 practice-task checker. Read-only.
fail=0
if [ "$(systemctl is-enabled nfs-server 2>/dev/null)" = "enabled" ]; then echo "PASS: nfs-server starts at boot"; else echo "FAIL: nfs-server does not start at boot"; fail=1; fi
if [ "$(systemctl is-active nfs-server 2>/dev/null)" = "active" ]; then echo "PASS: nfs-server is running now"; else echo "FAIL: nfs-server is not running now"; fail=1; fi
if [ "$(systemctl is-enabled cockpit.socket 2>/dev/null)" = "disabled" ]; then echo "PASS: cockpit.socket does not start at boot"; else echo "FAIL: cockpit.socket still starts at boot"; fail=1; fi
exit $fail
