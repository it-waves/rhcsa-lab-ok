#!/usr/bin/env bash
# N60 practice-task checker. Read-only.
f=/etc/practice.conf
if [ ! -f "$f" ]; then echo "FAIL: $f does not exist (run setup.sh first)"; exit 1; fi
t=$(ls -Z "$f" | cut -d: -f3)
if [ "$t" = "etc_t" ]; then echo "PASS: $f has the default type etc_t"; exit 0; else echo "FAIL: $f has the type $t, not etc_t"; exit 1; fi
