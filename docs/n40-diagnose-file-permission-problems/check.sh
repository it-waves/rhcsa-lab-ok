#!/usr/bin/env bash
# N40 practice-task checker. Read-only (it runs run.sh, which only prints a line).
fail=0
cd ~ 2>/dev/null
if [ "$(./run.sh 2>/dev/null)" = "run ok" ]; then echo "PASS: run.sh runs as student"; else echo "FAIL: run.sh does not run"; fail=1; fi
if [ "$(cat /srv/data/private/plan.txt 2>/dev/null)" = "plan ok" ]; then echo "PASS: student can read plan.txt"; else echo "FAIL: student cannot read /srv/data/private/plan.txt"; fail=1; fi
m=$(stat -c %a /srv/data/private 2>/dev/null | tail -c 2)
case "$m" in *[2367]) echo "FAIL: the folder is writable by others (too open)"; fail=1;; *) echo "PASS: the folder is not writable by others";; esac
exit $fail
