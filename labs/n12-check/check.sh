#!/usr/bin/env bash
# N12 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if ls lab12repo/zip-*.rpm >/dev/null 2>&1; then echo "PASS: lab12repo holds the zip package file"; else echo "FAIL: lab12repo should hold the downloaded zip rpm file"; fail=1; fi
if [ -f lab12repo/repodata/repomd.xml ]; then echo "PASS: lab12repo has repository metadata (repodata)"; else echo "FAIL: lab12repo has no repodata; build it with createrepo_c"; fail=1; fi
if grep -l '^baseurl=file://.*lab12repo' /etc/yum.repos.d/*.repo >/dev/null 2>&1; then echo "PASS: a .repo file in /etc/yum.repos.d points to lab12repo"; else echo "FAIL: no .repo file in /etc/yum.repos.d has a baseurl pointing to lab12repo"; fail=1; fi
f=$(grep -l '^baseurl=file://.*lab12repo' /etc/yum.repos.d/*.repo 2>/dev/null | head -n 1)
if [ -n "$f" ] && grep -q '^enabled=1' "$f"; then echo "PASS: that repository is enabled"; else echo "FAIL: the lab12repo repository should be enabled (enabled=1)"; fail=1; fi
exit $fail
