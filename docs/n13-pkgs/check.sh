#!/usr/bin/env bash
# N13 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ "$(sed -n 1p lab13/answer.txt 2>/dev/null)" = "telnet" ]; then echo "PASS: line 1 of lab13/answer.txt is telnet (the package that provides /usr/bin/telnet)"; else echo "FAIL: line 1 of lab13/answer.txt should be the package name that provides /usr/bin/telnet"; fail=1; fi
if rpm -q telnet >/dev/null 2>&1; then echo "PASS: telnet is installed"; else echo "FAIL: telnet should be installed"; fail=1; fi
if rpm -q tree >/dev/null 2>&1; then echo "FAIL: tree should be removed again"; fail=1; else echo "PASS: tree is not installed"; fi
exit $fail
