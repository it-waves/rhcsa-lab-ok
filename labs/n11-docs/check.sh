#!/usr/bin/env bash
# N11 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ "$(sed -n 1p lab11/answer.txt 2>/dev/null)" = "-S" ]; then echo "PASS: line 1 is -S (the ls option that sorts by size)"; else echo "FAIL: line 1 of lab11/answer.txt should be the ls option that sorts by file size"; fail=1; fi
if [ "$(sed -n 2p lab11/answer.txt 2>/dev/null)" = "5" ]; then echo "PASS: line 2 is 5 (the section for the passwd file format)"; else echo "FAIL: line 2 should be the man section number for the /etc/passwd file format"; fail=1; fi
exit $fail
