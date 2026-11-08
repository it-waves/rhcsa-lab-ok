#!/usr/bin/env bash
# N08 practice-task checker. Read-only. Run as the user who did the task, from your home directory.
fail=0; cd "$HOME" || exit 1
if [ -d lab8/a ] && [ -d lab8/b ]; then echo "PASS: directories lab8/a and lab8/b exist"; else echo "FAIL: create lab8/a and lab8/b"; fail=1; fi
if [ "$(cat lab8/b/one.txt 2>/dev/null)" = "data" ]; then echo "PASS: lab8/b/one.txt is a copy holding the text data"; else echo "FAIL: lab8/b/one.txt should be a copy of the file (text: data)"; fail=1; fi
if [ "$(cat lab8/a/two.txt 2>/dev/null)" = "data" ] && [ ! -e lab8/a/one.txt ]; then echo "PASS: lab8/a/one.txt was renamed to two.txt"; else echo "FAIL: lab8/a/one.txt should be renamed to lab8/a/two.txt"; fail=1; fi
exit $fail
