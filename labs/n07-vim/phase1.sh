. /tmp/lab/lib.sh
srun 'dnf install -y vim-enhanced tmux >/dev/null 2>&1; rpm -q tmux'
step "P1"
run 'export TERM=xterm-256color; tmux -f /dev/null -L c new-session -d -s c -x 70 -y 12 "vim notes.txt; echo vim-exit=$?; sleep 30"; sleep 2; tmux -L c capture-pane -t c -p'
step "P2 keys"
run 'export TERM=xterm-256color; tmux -L c send-keys -t c i "Hello RHCSA" Escape; sleep 1; tmux -L c capture-pane -t c -p'
run 'export TERM=xterm-256color; tmux -L c send-keys -t c ":wq" Enter; sleep 1; tmux -L c capture-pane -t c -p; cat notes.txt'
