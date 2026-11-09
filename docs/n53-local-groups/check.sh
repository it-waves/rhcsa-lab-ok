#!/usr/bin/env bash
# N53 practice-task checker. Read-only.
fail=0
g=$(getent group ops)
if [ -n "$g" ]; then echo "PASS: group ops exists"; else echo "FAIL: group ops does not exist"; fail=1; fi
if [ "$(echo "$g" | cut -d: -f3)" = "4000" ]; then echo "PASS: group ops has GID 4000"; else echo "FAIL: group ops does not have GID 4000"; fail=1; fi
m=",$(echo "$g" | cut -d: -f4),"
case "$m" in *,erin,*) echo "PASS: erin is a member of ops";; *) echo "FAIL: erin is not a member of ops"; fail=1;; esac
case "$m" in *,frank,*) echo "PASS: frank is a member of ops";; *) echo "FAIL: frank is not a member of ops"; fail=1;; esac
if getent group temp >/dev/null; then echo "FAIL: group temp still exists"; fail=1; else echo "PASS: group temp is deleted"; fi
exit $fail
