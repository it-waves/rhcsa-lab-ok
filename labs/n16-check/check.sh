#!/usr/bin/env bash
# N16 practice-task checker. Read-only. Run as the user who did the task.
fail=0
f="$HOME/lab16/exists.sh"
if [ -f "$f" ]; then echo "PASS: lab16/exists.sh exists"; else echo "FAIL: create lab16/exists.sh"; exit 1; fi
if [ -x "$f" ]; then echo "PASS: the script is executable"; else echo "FAIL: make the script executable (chmod +x)"; fail=1; fi
if [ "$(head -n 1 "$f")" = "#!/bin/bash" ]; then echo "PASS: the first line is #!/bin/bash"; else echo "FAIL: the first line should be #!/bin/bash"; fail=1; fi
if grep -Eq '^[[:space:]]*if[[:space:]]' "$f" && grep -Eq '(\[|test)[[:space:]]' "$f"; then echo "PASS: the script uses if with a test"; else echo "FAIL: use if with [ ] or test"; fail=1; fi
out=$("$f" 2>/dev/null)
if [ "$out" = "found" ]; then echo "PASS: it prints found when /etc/hosts exists"; else echo "FAIL: expected the output: found"; fail=1; fi
exit $fail
