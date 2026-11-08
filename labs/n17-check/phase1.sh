. /tmp/lab/lib.sh
step "Solution"
mkdir -p lab17
cat > lab17/hello.sh <<'EOT'
#!/bin/bash
for name in "$@"; do
    echo "Hello, $name"
done
EOT
run 'chmod +x lab17/hello.sh'
step "Checker"
run 'bash /tmp/lab/check.sh'
step "Checker fails on a script with no loop"
printf '#!/bin/bash\necho "Hello, $1"\n' > lab17/hello.sh
run 'bash /tmp/lab/check.sh'
cat > lab17/hello.sh <<'EOT'
#!/bin/bash
for name in "$@"; do
    echo "Hello, $name"
done
EOT
