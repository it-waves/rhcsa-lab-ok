. /tmp/lab/lib.sh
step "Solution"
mkdir -p lab16
cat > lab16/exists.sh <<'EOT'
#!/bin/bash
if [ -f /etc/hosts ]; then
    echo "found"
else
    echo "missing"
fi
EOT
run 'chmod +x lab16/exists.sh'
step "Checker"
run 'bash /tmp/lab/check.sh'
step "Checker fails on a broken script"
run 'chmod -x lab16/exists.sh'
run 'bash /tmp/lab/check.sh'
run 'chmod +x lab16/exists.sh'
