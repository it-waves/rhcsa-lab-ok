#!/usr/bin/env bash
# N46 practice-task checker. Read-only.
fail=0
if grep -q '^GRUB_TIMEOUT=7$' /etc/default/grub 2>/dev/null; then echo "PASS: /etc/default/grub has GRUB_TIMEOUT=7"; else echo "FAIL: /etc/default/grub does not have GRUB_TIMEOUT=7"; fail=1; fi
if sudo grep -q '^set timeout=7$' /boot/grub2/grub.cfg 2>/dev/null; then echo "PASS: grub.cfg has set timeout=7"; else echo "FAIL: grub.cfg does not have set timeout=7 (run grub2-mkconfig)"; fail=1; fi
if sudo grubby --info=ALL 2>/dev/null | grep -q 'args=.*loglevel=5'; then echo "PASS: every kernel entry has loglevel=5"; else echo "FAIL: a kernel entry is missing loglevel=5"; fail=1; fi
exit $fail
