. /tmp/lab/lib.sh
step "1. Standard streams and > (overwrite)"
run 'mkdir redir'
run 'echo "first line"'
run 'echo "first line" > redir/out.txt'
run 'cat redir/out.txt'
run 'echo "second line" > redir/out.txt'
run 'cat redir/out.txt'
step "2. >> (append)"
run 'echo "third line" >> redir/out.txt'
run 'cat redir/out.txt'
step "3. | (pipe)"
run 'ls /etc | head -n 5'
run 'ls /etc | wc -l'
step "4. 2> (standard error)"
run 'ls /nonexistent /etc/hostname'
run 'ls /nonexistent /etc/hostname > redir/good.txt 2> redir/bad.txt'
run 'cat redir/good.txt'
run 'cat redir/bad.txt'
step "5. Both streams, and discarding"
run 'ls /nonexistent /etc/hostname > redir/both.txt 2>&1'
run 'cat redir/both.txt'
run 'ls /nonexistent 2> /dev/null'
step "6. < (input) and tee"
run 'wc -l < redir/out.txt'
run 'echo "saved and shown" | tee redir/tee.txt'
run 'cat redir/tee.txt'
step "Practice task, solved (not shown in the video)"
run 'mkdir lab3'
run 'ls /etc/hostname /nonexistent > lab3/ok.txt 2> lab3/err.txt'
run 'ls -l lab3'
