#!/usr/bin/env bash
# V00 practice-task checker. Read-only. Run on your own lab as any user.
want_host="node1.lab.example"; user="labuser"; fail=0
h=$(hostnamectl --static 2>/dev/null)
if [ "$h" = "$want_host" ]; then echo "PASS: static hostname is $want_host"; else echo "FAIL: static hostname is '$h', expected $want_host"; fail=1; fi
if id "$user" >/dev/null 2>&1; then echo "PASS: user $user exists"; else echo "FAIL: user $user not found"; fail=1; fi
if [ "$(awk '{print int($1/60)}' /proc/uptime)" -lt 1440 ]; then up=$(uptime -p); echo "INFO: $up (run this after you reboot)"; fi
exit $fail
