. /tmp/lab/lib.sh
step "0. Install tools"
srun 'dnf install -y vim-enhanced tmux >/dev/null; rpm -q vim-enhanced tmux'
step "1. Probe vim in tmux"
run 'which vim'
run 'export TERM=xterm-256color; setsid -f tmux new-session -d -s v -x 70 -y 12 "vim notes.txt"; sleep 1; echo started'
run 'sleep 1'
run 'TERM=xterm-256color tmux capture-pane -t v -p'
run 'TERM=xterm-256color tmux send-keys -t v i "Hello RHCSA" Escape'
run 'TERM=xterm-256color tmux capture-pane -t v -p'
run 'TERM=xterm-256color tmux send-keys -t v ":wq" Enter'
run 'sleep 1'
run 'cat notes.txt'
