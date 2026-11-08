#!/usr/bin/env bash
# N21 practice-task checker. Read-only. Run as the user who did the task, after the reboot.
fail=0
if grep -q 'systemd.unit=graphical.target' /proc/cmdline; then echo "PASS: this boot used systemd.unit=graphical.target"; else echo "FAIL: this boot did not use systemd.unit=graphical.target"; fail=1; fi
if [ "$(systemctl is-active graphical.target)" = "active" ]; then echo "PASS: graphical.target is active"; else echo "FAIL: graphical.target is not active"; fail=1; fi
f="$HOME/lab21/target.txt"
if [ -f "$f" ] && [ "$(head -n 1 "$f")" = "active" ]; then echo "PASS: lab21/target.txt says active"; else echo "FAIL: lab21/target.txt should contain the output of systemctl is-active graphical.target"; fail=1; fi
if [ "$(systemctl get-default)" = "multi-user.target" ]; then echo "PASS: the default target was not changed"; else echo "FAIL: the default target should still be multi-user.target"; fail=1; fi
if sudo -n true 2>/dev/null; then
  if sudo -n grubby --info=DEFAULT 2>/dev/null | grep -q 'systemd.unit=graphical.target'; then echo "FAIL: remove the argument again (grubby --remove-args)"; fail=1; else echo "PASS: the argument is removed from the boot entries"; fi
else echo "SKIP: cannot check the boot entries without sudo"; fi
exit $fail
