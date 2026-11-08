. /tmp/lab/lib.sh
step "1. Save a command's output"
cat > host.sh <<'EOT'
#!/bin/bash
host=$(hostname -s)
echo "Running on $host"
EOT
chmod +x host.sh
run 'cat host.sh'
run './host.sh'
step "2. Count with a pipe"
mkdir -p data
touch data/a.txt data/b.txt data/c.txt
cat > count.sh <<'EOT'
#!/bin/bash
count=$(ls data | wc -l)
echo "Files in data: $count"
EOT
chmod +x count.sh
run 'ls data'
run 'cat count.sh'
run './count.sh'
step "3. Use the output in a test"
cat > whoami.sh <<'EOT'
#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
    echo "You are root"
else
    echo "You are a normal user"
fi
EOT
chmod +x whoami.sh
run 'cat whoami.sh'
run './whoami.sh'
step "4. Loop over the output"
cat > each.sh <<'EOT'
#!/bin/bash
for f in $(ls data); do
    echo "Found: $f"
done
EOT
chmod +x each.sh
run 'cat each.sh'
run './each.sh'
