#!/usr/bin/env bash
# N22 practice-task checker. Read-only. Run as the user who did the task, after the final reboot.
fail=0
if sudo -n true 2>/dev/null; then
  st=$(sudo -n passwd -S root | awk '{print $2}')
  if [ "$st" = "P" ]; then echo "PASS: root has a usable password (status P)"; else echo "FAIL: root is locked or has no password (status $st)"; fail=1; fi
else echo "SKIP: cannot read the root password status without sudo"; fi
if [ "$(getenforce)" = "Enforcing" ]; then echo "PASS: SELinux is Enforcing"; else echo "FAIL: SELinux should be Enforcing"; fail=1; fi
if [ -e /.autorelabel ]; then echo "FAIL: /.autorelabel is still there, reboot once more so the relabel can finish"; fail=1; else echo "PASS: no /.autorelabel left, the relabel is done"; fi
s=$(systemctl is-system-running --wait 2>/dev/null)
case "$s" in running|degraded) echo "PASS: the system finished booting ($s)";; *) echo "FAIL: the system is not up ($s)"; fail=1;; esac
exit $fail
