#!/usr/bin/env bash
# N10 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ -f lab10/notes.txt ] && [ "$(stat -c %a lab10/notes.txt)" = "640" ]; then echo "PASS: lab10/notes.txt exists with permissions 640 (rw-r-----)"; else echo "FAIL: lab10/notes.txt should be a file with permissions 640"; fail=1; fi
if [ -d lab10/shared ] && [ "$(stat -c %a lab10/shared)" = "750" ]; then echo "PASS: lab10/shared exists with permissions 750 (rwxr-x---)"; else echo "FAIL: lab10/shared should be a directory with permissions 750"; fail=1; fi
exit $fail
