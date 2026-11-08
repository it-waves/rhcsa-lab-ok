. /tmp/lab/lib.sh
step "1. The prompt and the shell"
run 'whoami'
run 'hostname'
run 'echo $SHELL'
run 'pwd'
step "2. Command, option, argument"
run 'ls -l /etc/hostname'
run 'uname -r'
run 'uname --kernel-release'
run 'ls -ld /etc /tmp'
step "3. Wrong syntax and exit status"
run 'LS /etc/hostname; echo "exit status: $?"'
run 'ls-l /etc/hostname; echo "exit status: $?"'
run 'ls -z; echo "exit status: $?"'
run 'ls /nonexistent; echo "exit status: $?"'
run 'mkdir; echo "exit status: $?"'
run 'ls /etc/hostname; echo "exit status: $?"'
step "4. Spaces and quotes"
run 'mkdir -p ~/syntax-demo && cd ~/syntax-demo && touch my file && ls -1'
run 'rm ~/syntax-demo/my ~/syntax-demo/file && cd ~/syntax-demo && touch "my file" && ls -1'
step "5. Built-in help"
run 'ls --help | head -n 4'
run 'command -v man || echo "man is not installed"'
step "Practice task, solved (not shown in the video)"
run 'mkdir -p ~/lab1 && touch ~/lab1/notes.txt'
run 'ls -l ~/lab1'
