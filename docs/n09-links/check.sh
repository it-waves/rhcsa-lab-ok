#!/usr/bin/env bash
# N09 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ -f links/base.txt ]; then echo "PASS: links/base.txt exists"; else echo "FAIL: create links/base.txt"; fail=1; fi
if [ -f links/base-hard.txt ] && [ ! -L links/base-hard.txt ] && [ "$(stat -c %i links/base.txt)" = "$(stat -c %i links/base-hard.txt)" ]; then echo "PASS: base-hard.txt is a hard link (same inode)"; else echo "FAIL: links/base-hard.txt should be a hard link to base.txt"; fail=1; fi
if [ -L links/base-soft.txt ] && [ "$(cat links/base-soft.txt 2>/dev/null)" = "lab9" ]; then echo "PASS: base-soft.txt is a soft link that reads lab9"; else echo "FAIL: links/base-soft.txt should be a soft link to base.txt"; fail=1; fi
exit $fail
