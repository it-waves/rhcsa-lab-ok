. /tmp/lab/lib.sh
vs() { printf '[%s@%s ~]$ vim %s\n' "$(id -un)" "$(hostname -s)" "$1"; python3 /tmp/lab/vimdrive.py "$1"; echo "# exit=$?"; }
step "0. Setup (not shown)"
srun 'dnf install -y python3-pip >/dev/null 2>&1; rpm -q python3-pip'
run 'python3 -m pip install --user pyte 2>&1 | tail -1'
step "1. Create a file from the shell"
run 'touch empty.txt'
run 'ls -l empty.txt'
run 'echo "line one" > notes.txt'
run 'echo "line two" >> notes.txt'
run 'cat notes.txt'
step "2. Install vim"
run 'which vim'
srun 'dnf install -y vim-enhanced'
run 'which vim'
step "3. vim: insert text and save"
vs notes.txt <<'EOT'
S opened
K G
K o
K line three
S insert
K \e
S normal
K :wq\r
EOT
run 'cat notes.txt'
step "4. vim: delete a line, undo, quit without saving"
vs notes.txt <<'EOT'
K gg
K dd
S deleted
K u
S undone
K :q!\r
EOT
run 'cat notes.txt'
step "5. vim: search and delete, then save"
vs notes.txt <<'EOT'
K /three\r
S found
K dd
S gone
K :wq\r
EOT
run 'cat notes.txt'
step "Practice task, solved (not shown in the video)"
vs lab7.txt <<'EOT'
K i
K alpha\rbeta\rgamma
K \e
K :wq\r
EOT
vs lab7.txt <<'EOT'
K gg
K j
K dd
K G
K o
K delta
K \e
K :wq\r
EOT
run 'cat lab7.txt'
