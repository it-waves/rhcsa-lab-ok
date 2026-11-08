. /tmp/lab/lib.sh
step "1. Standard streams and > (overwrite)"
run 'mkdir -p ~/redir && cd ~/redir && echo "first line" > out.txt && cat out.txt'
run 'cd ~/redir && echo "second line" > out.txt && cat out.txt'
step "2. >> (append)"
run 'cd ~/redir && echo "third line" >> out.txt && cat out.txt'
step "3. | (pipe)"
run 'ls /etc | head -n 5'
run 'ls /etc | wc -l'
step "4. 2> (standard error)"
run 'cd ~/redir && ls /nonexistent /etc/hostname'
run 'cd ~/redir && ls /nonexistent /etc/hostname > good.txt 2> bad.txt; echo "--- good.txt:"; cat good.txt; echo "--- bad.txt:"; cat bad.txt'
step "5. Both streams, and discarding"
run 'cd ~/redir && ls /nonexistent /etc/hostname > both.txt 2>&1; cat both.txt'
run 'ls /nonexistent 2> /dev/null; echo "exit status: $?"'
step "6. < (input) and tee"
run 'cd ~/redir && wc -l < out.txt'
run 'cd ~/redir && echo "saved and shown" | tee tee.txt && cat tee.txt'
step "Practice task, solved (not shown in the video)"
run 'mkdir -p ~/lab3 && ls /etc/hostname /nonexistent > ~/lab3/ok.txt 2> ~/lab3/err.txt; ls -l ~/lab3'
