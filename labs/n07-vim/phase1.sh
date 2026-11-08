. /tmp/lab/lib.sh
srun 'dnf install -y vim-enhanced python3-pip >/dev/null 2>&1; rpm -q vim-enhanced'
run 'python3 -m pip install --user pyte 2>&1 | tail -1'
step "P"
run 'printf "line one\nline two\n" > notes.txt'
run 'python3 /tmp/lab/vimdrive.py notes.txt <<EOT
S start
K G
K o
K line three
S insert
K \e
S normal
K :wq\r
EOT
cat notes.txt'
