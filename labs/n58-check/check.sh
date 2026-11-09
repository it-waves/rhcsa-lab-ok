#!/usr/bin/env bash
# N58 practice-task checker. Read-only.
fail=0
if [ "$(getenforce)" = "Permissive" ]; then echo "PASS: SELinux is permissive now"; else echo "FAIL: SELinux is $(getenforce), not permissive, now"; fail=1; fi
if grep -q '^SELINUX=permissive$' /etc/selinux/config; then echo "PASS: /etc/selinux/config says SELINUX=permissive"; else echo "FAIL: /etc/selinux/config does not say SELINUX=permissive"; fail=1; fi
exit $fail
