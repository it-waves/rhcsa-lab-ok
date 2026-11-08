. /tmp/lab/lib.sh
step "Solution"
mkdir -p lab18
cat > lab18/who.sh <<'EOT'
#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 name city"
    exit 1
fi
echo "$1 lives in $2"
EOT
run 'chmod +x lab18/who.sh'
step "Checker"
run 'bash /tmp/lab/check.sh'
step "Checker fails on a hard-coded script"
printf '#!/bin/bash\necho "Zed lives in Rome"\n' > lab18/who.sh
run 'bash /tmp/lab/check.sh'
cat > lab18/who.sh <<'EOT'
#!/bin/bash
if [ $# -lt 2 ]; then
    echo "Usage: $0 name city"
    exit 1
fi
echo "$1 lives in $2"
EOT
