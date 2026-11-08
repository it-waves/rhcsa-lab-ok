#!/usr/bin/env bash
# N17 practice-task checker. Read-only. Run as the user who did the task.
fail=0
f="$HOME/lab17/hello.sh"
if [ -f "$f" ]; then echo "PASS: lab17/hello.sh exists"; else echo "FAIL: create lab17/hello.sh"; exit 1; fi
if [ -x "$f" ]; then echo "PASS: the script is executable"; else echo "FAIL: make the script executable (chmod +x)"; fail=1; fi
if [ "$(head -n 1 "$f")" = "#!/bin/bash" ]; then echo "PASS: the first line is #!/bin/bash"; else echo "FAIL: the first line should be #!/bin/bash"; fail=1; fi
if grep -Eq '^[[:space:]]*(for|while)[[:space:]]' "$f"; then echo "PASS: the script uses a loop"; else echo "FAIL: use a for or while loop"; fail=1; fi
out=$("$f" Zed Mia Kai 2>/dev/null)
exp=$'Hello, Zed\nHello, Mia\nHello, Kai'
if [ "$out" = "$exp" ]; then echo "PASS: it greets every argument"; else echo "FAIL: ./hello.sh Zed Mia Kai should print Hello, Zed then Hello, Mia then Hello, Kai"; fail=1; fi
if [ -z "$("$f" 2>/dev/null)" ]; then echo "PASS: with no arguments it prints nothing"; else echo "FAIL: with no arguments it should print nothing"; fail=1; fi
exit $fail
