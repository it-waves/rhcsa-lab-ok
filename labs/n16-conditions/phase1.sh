. /tmp/lab/lib.sh
# several commands in ONE shell, each shown on its own prompt line (so $? carries over)
seqrun() {
  local s="__rc=0"$'\n'
  for c in "$@"; do s+="printf '[%s@%s ~]\$ %s\n' \"\$(id -un)\" \"\$(hostname -s)\" $(printf %q "$c")"$'\n'"(exit \$__rc)"$'\n'"$c"$'\n'"__rc=\$?"$'\n'; done
  bash -c "$s" 2>&1
  echo "# exit=$?"
}
step "1. The exit status"
seqrun 'test -f /etc/passwd' 'echo $?'
seqrun 'test -f /etc/nothing' 'echo $?'
seqrun '[ -d /etc ]' 'echo $?'
step "2. A first script with if"
cat > check.sh <<'EOT'
#!/bin/bash
if [ -f /etc/redhat-release ]; then
    echo "This is a Red Hat family system"
else
    echo "This is not a Red Hat family system"
fi
EOT
run 'cat check.sh'
run './check.sh'
run 'ls -l check.sh'
run 'chmod +x check.sh'
run 'ls -l check.sh'
run './check.sh'
step "3. elif, numbers and strings"
cat > compare.sh <<'EOT'
#!/bin/bash
number=7
name=student
if [ "$number" -gt 10 ]; then
    echo "bigger than 10"
elif [ "$number" -eq 7 ]; then
    echo "exactly 7"
else
    echo "something else"
fi
if [ "$name" = "student" ]; then
    echo "hello, student"
fi
EOT
run 'cat compare.sh'
run 'chmod +x compare.sh'
run './compare.sh'
step "4. And, or"
run '[ -d /tmp ] && echo "/tmp exists"'
run '[ -d /nothing ] || echo "/nothing is missing"'
step "5. The exit status of a script"
seqrun './check.sh' 'echo $?'
