. /tmp/lab/lib.sh
step "1. for with a list"
cat > loop1.sh <<'EOT'
#!/bin/bash
for fruit in apple banana cherry; do
    echo "I like $fruit"
done
EOT
run 'cat loop1.sh'
run 'chmod +x loop1.sh'
run './loop1.sh'
step "2. Counting"
cat > count.sh <<'EOT'
#!/bin/bash
for number in {1..5}; do
    echo "Number $number"
done
EOT
chmod +x count.sh
run 'echo {1..5}'
run 'cat count.sh'
run './count.sh'
step "3. Files"
printf 'one\ntwo\n' > a.txt
printf 'one\ntwo\nthree\n' > b.txt
printf 'one\n' > c.txt
cat > files.sh <<'EOT'
#!/bin/bash
for file in *.txt; do
    echo "File: $file"
    wc -l "$file"
done
EOT
chmod +x files.sh
run 'ls *.txt'
run 'cat files.sh'
run './files.sh'
step "4. Command line input"
cat > hello.sh <<'EOT'
#!/bin/bash
for name in "$@"; do
    echo "Hello, $name"
done
EOT
chmod +x hello.sh
run 'cat hello.sh'
run './hello.sh Ana Ben Chen'
run './hello.sh'
step "5. Reading a file line by line"
printf 'red\ngreen\nblue\n' > colors.txt
cat > readfile.sh <<'EOT'
#!/bin/bash
while read -r line; do
    echo "Read: $line"
done < colors.txt
EOT
chmod +x readfile.sh
run 'cat colors.txt'
run 'cat readfile.sh'
run './readfile.sh'
