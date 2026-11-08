. /tmp/lab/lib.sh
# Lab preparation (silent; not the objective). The runner has no keyboard, so a key lets ssh log in without typing a password.
# Key-based authentication has its own objective later in the course.
ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519 </dev/null
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-keyscan localhost >> ~/.ssh/known_hosts 2>/dev/null
step "1. Log in and run a command: ssh user@host command"
run 'ssh student@localhost hostname'
run 'ssh localhost hostname'
run 'ssh localhost whoami'
step "2. Choose the port"
run 'ssh -p 22 localhost hostname'
step "3. Copy files with scp"
run 'echo "hello from node1" > hello.txt'
run 'scp hello.txt localhost:/tmp/hello.txt'
run 'ssh localhost cat /tmp/hello.txt'
run 'scp localhost:/tmp/hello.txt copy.txt'
run 'cat copy.txt'
step "4. When it fails"
run 'ssh nosuchhost hostname'
run 'ssh nobody@localhost hostname'
step "Practice task, solved (not shown in the video)"
run 'mkdir lab5'
run 'ssh localhost hostname > lab5/remote-host.txt'
run 'cat lab5/remote-host.txt'
