#!/usr/bin/env bash
# N18 practice-task checker. Read-only. Run as the user who did the task.
fail=0
f="$HOME/lab18/who.sh"
if [ -f "$f" ]; then echo "PASS: lab18/who.sh exists"; else echo "FAIL: create lab18/who.sh"; exit 1; fi
if [ -x "$f" ]; then echo "PASS: the script is executable"; else echo "FAIL: make the script executable (chmod +x)"; fail=1; fi
if [ "$(head -n 1 "$f")" = "#!/bin/bash" ]; then echo "PASS: the first line is #!/bin/bash"; else echo "FAIL: the first line should be #!/bin/bash"; fail=1; fi
out=$("$f" Zed Rome 2>/dev/null)
if [ "$out" = "Zed lives in Rome" ]; then echo "PASS: ./who.sh Zed Rome prints: Zed lives in Rome"; else echo "FAIL: ./who.sh Zed Rome should print: Zed lives in Rome"; fail=1; fi
out=$("$f" Mia Oslo 2>/dev/null)
if [ "$out" = "Mia lives in Oslo" ]; then echo "PASS: other names and cities work too"; else echo "FAIL: do not hard-code the words; use \$1 and \$2"; fail=1; fi
"$f" Zed >/tmp/n18.out 2>&1; rc=$?
if [ "$rc" -eq 1 ] && grep -q '^Usage' /tmp/n18.out; then echo "PASS: with one argument it prints a Usage line and exits 1"; else echo "FAIL: with fewer than 2 arguments print a line starting with Usage and exit 1"; fail=1; fi
"$f" >/tmp/n18.out 2>&1; rc=$?
if [ "$rc" -eq 1 ] && grep -q '^Usage' /tmp/n18.out; then echo "PASS: with no arguments it prints a Usage line and exits 1"; else echo "FAIL: with no arguments print a line starting with Usage and exit 1"; fail=1; fi
rm -f /tmp/n18.out
exit $fail
