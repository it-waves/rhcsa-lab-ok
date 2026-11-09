#!/usr/bin/env bash
# N59 practice-task checker. Read-only.
fail=0
f=$HOME/context.txt
want1=$(ls -Z /etc/shadow | cut -d: -f3)
want2=$(ps -Z -C sshd | sed -n 2p | cut -d: -f3)
if [ ! -f "$f" ]; then echo "FAIL: $f does not exist"; exit 1; fi
if [ "$(sed -n 1p "$f")" = "$want1" ]; then echo "PASS: line 1 is the type of /etc/shadow ($want1)"; else echo "FAIL: line 1 is not the type of /etc/shadow"; fail=1; fi
if [ "$(sed -n 2p "$f")" = "$want2" ]; then echo "PASS: line 2 is the type of the sshd process ($want2)"; else echo "FAIL: line 2 is not the type of the sshd process"; fail=1; fi
exit $fail
