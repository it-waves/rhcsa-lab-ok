. /tmp/lab/lib.sh
step "Solution"
mkdir -p lab19
cat > lab19/report.sh <<'EOT'
#!/bin/bash
host=$(hostname -s)
accounts=$(wc -l < /etc/passwd)
echo "Host: $host"
echo "Accounts: $accounts"
EOT
run 'chmod +x lab19/report.sh'
run './lab19/report.sh'
step "Checker"
run 'bash /tmp/lab/check.sh'
step "Checker fails on a hard-coded script"
printf '#!/bin/bash\necho "Host: node1"\necho "Accounts: 30"\n' > lab19/report.sh
run 'bash /tmp/lab/check.sh'
cat > lab19/report.sh <<'EOT'
#!/bin/bash
host=$(hostname -s)
accounts=$(wc -l < /etc/passwd)
echo "Host: $host"
echo "Accounts: $accounts"
EOT
