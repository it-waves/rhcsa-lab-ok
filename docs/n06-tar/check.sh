#!/usr/bin/env bash
# N06 practice-task checker. Read-only. Run on your own lab as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ -s backup.tar.gz ] && gzip -t backup.tar.gz 2>/dev/null; then echo "PASS: backup.tar.gz exists and is a valid gzip file"; else echo "FAIL: backup.tar.gz missing or not gzip-compressed"; fail=1; fi
if [ -s backup.tar.gz ] && tar -tzf backup.tar.gz 2>/dev/null | grep -q '^project/readme.txt$'; then echo "PASS: the archive contains project/readme.txt"; else echo "FAIL: the archive should contain the project folder"; fail=1; fi
if [ -f lab6/project/readme.txt ] && cmp -s lab6/project/readme.txt project/readme.txt; then echo "PASS: lab6/project/readme.txt was extracted and matches the original"; else echo "FAIL: lab6/project/readme.txt missing or different"; fail=1; fi
exit $fail
