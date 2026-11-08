#!/usr/bin/env bash
# V01 practice-task checker. Read-only. Run on your own lab as the user who did the task.
fail=0
if [ -d "$HOME/lab1" ]; then echo "PASS: directory ~/lab1 exists"; else echo "FAIL: directory ~/lab1 not found"; fail=1; fi
if [ -f "$HOME/lab1/notes.txt" ]; then echo "PASS: file ~/lab1/notes.txt exists"; else echo "FAIL: file ~/lab1/notes.txt not found"; fail=1; fi
n=$(find "$HOME/lab1" -mindepth 1 -maxdepth 1 2>/dev/null | wc -l)
if [ "$n" -eq 1 ]; then echo "PASS: ~/lab1 holds exactly one item"; else echo "FAIL: ~/lab1 holds $n items, expected 1 (did a space split a name?)"; fail=1; fi
exit $fail
