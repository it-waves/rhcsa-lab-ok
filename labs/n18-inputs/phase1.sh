. /tmp/lab/lib.sh
# several commands in ONE shell, each shown on its own prompt line (so $? carries over)
seqrun() {
  local s="__rc=0"$'\n'
  for c in "$@"; do s+="printf '[%s@%s ~]\$ %s\n' \"\$(id -un)\" \"\$(hostname -s)\" $(printf %q "$c")"$'\n'"(exit \$__rc)"$'\n'"$c"$'\n'"__rc=\$?"$'\n'; done
  bash -c "$s" 2>&1
  echo "# exit=$?"
}
step "1. Arguments"
cat > args.sh <<'EOT'
#!/bin/bash
echo "Script name: $0"
echo "First: $1"
echo "Second: $2"
echo "Count: $#"
echo "All: $@"
EOT
chmod +x args.sh
run 'cat args.sh'
run './args.sh red green blue'
step "2. Empty and quoted arguments"
run './args.sh'
run './args.sh "red green" blue'
step "3. Check the input"
cat > greet.sh <<'EOT'
#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Usage: $0 name"
    exit 1
fi
echo "Hello, $1"
EOT
chmod +x greet.sh
run 'cat greet.sh'
seqrun './greet.sh' 'echo $?'
seqrun './greet.sh Ana' 'echo $?'
step "4. A default value"
cat > hi.sh <<'EOT'
#!/bin/bash
echo "Hello, ${1:-world}"
EOT
chmod +x hi.sh
run 'cat hi.sh'
run './hi.sh'
run './hi.sh Ana'
