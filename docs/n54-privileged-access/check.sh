#!/usr/bin/env bash
# N54 practice-task checker. Read-only.
fail=0
if id -nG gina 2>/dev/null | tr ' ' '\n' | grep -qx wheel; then echo "PASS: gina is in the group wheel"; else echo "FAIL: gina is not in the group wheel"; fail=1; fi
if [ -f /etc/sudoers.d/hank ] || sudo test -f /etc/sudoers.d/hank; then echo "PASS: the file /etc/sudoers.d/hank exists"; else echo "FAIL: the file /etc/sudoers.d/hank does not exist"; fail=1; fi
if [ "$(sudo stat -c %a /etc/sudoers.d/hank 2>/dev/null)" = "440" ]; then echo "PASS: the file mode is 0440"; else echo "FAIL: the file mode is not 0440"; fail=1; fi
r=$(sudo -l -U hank 2>/dev/null)
case "$r" in *NOPASSWD*/usr/bin/systemctl*) echo "PASS: hank may run /usr/bin/systemctl without a password";; *) echo "FAIL: hank may not run /usr/bin/systemctl without a password"; fail=1;; esac
if sudo visudo -c >/dev/null 2>&1; then echo "PASS: the sudoers syntax is valid"; else echo "FAIL: the sudoers syntax is not valid"; fail=1; fi
exit $fail
