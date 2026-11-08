#!/usr/bin/env bash
# N19 practice-task checker. Read-only. Run as the user who did the task.
fail=0
f="$HOME/lab19/report.sh"
if [ -f "$f" ]; then echo "PASS: lab19/report.sh exists"; else echo "FAIL: create lab19/report.sh"; exit 1; fi
if [ -x "$f" ]; then echo "PASS: the script is executable"; else echo "FAIL: make the script executable (chmod +x)"; fail=1; fi
if [ "$(head -n 1 "$f")" = "#!/bin/bash" ]; then echo "PASS: the first line is #!/bin/bash"; else echo "FAIL: the first line should be #!/bin/bash"; fail=1; fi
if grep -Eq '\$\(|`' "$f"; then echo "PASS: the script captures command output"; else echo "FAIL: capture the output of a command with \$( )"; fail=1; fi
out=$("$f" 2>/dev/null)
exp1="Host: $(hostname -s)"
exp2="Accounts: $(wc -l < /etc/passwd)"
if [ "$(printf '%s\n' "$out" | sed -n 1p)" = "$exp1" ]; then echo "PASS: line 1 is: $exp1"; else echo "FAIL: line 1 should be: Host: followed by the short host name"; fail=1; fi
if [ "$(printf '%s\n' "$out" | sed -n 2p)" = "$exp2" ]; then echo "PASS: line 2 is: $exp2"; else echo "FAIL: line 2 should be: Accounts: followed by the number of lines in /etc/passwd"; fail=1; fi
exit $fail
