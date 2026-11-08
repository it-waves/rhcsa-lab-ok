. /tmp/lab/lib.sh
pg() { printf '[%s@%s ~]$ %s\n' "$(id -un)" "$(hostname -s)" "$*"; MANWIDTH=72 python3 /tmp/lab/pagedrive.py "$@"; echo "# exit=$?"; }
step "0. Setup (not shown)"
srun 'dnf install -y python3-pip >/dev/null 2>&1; rpm -q python3-pip'
run 'python3 -m pip install --user pyte 2>&1 | tail -1'
step "1. Search by keyword"
run 'man -k "owner and group"'
run 'whatis passwd'
srun 'mandb -q'
run 'man -k "owner and group"'
run 'whatis passwd'
run 'whatis ls'
step "2. Read a page"
run 'man -w ls'
pg man ls <<'EOT'
S opened
K  
S next screen
K /human\r
S search
K n
S next match
K q
EOT
step "3. Sections"
run 'man -w passwd'
run 'man 5 passwd'
srun 'dnf install -y man-pages'
run 'whatis passwd'
srun 'mandb -q'
run 'whatis passwd'
run 'man -w 5 passwd'
pg man 5 passwd <<'EOT'
S section five
K q
EOT
step "4. info"
run 'info ls'
srun 'dnf install -y info'
pg info ls <<'EOT'
S info opened
K q
EOT
step "5. Files in /usr/share/doc"
run 'ls /usr/share/doc | head -n 15'
run 'ls /usr/share/doc/chrony'
run 'rpm -qd chrony'
run 'head -n 8 /usr/share/doc/chrony/README'
step "Practice task, solved (not shown in the video)"
run 'mkdir lab11'
run 'echo "-S" > lab11/answer.txt'
run 'echo "5" >> lab11/answer.txt'
run 'cat lab11/answer.txt'
