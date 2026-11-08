. /tmp/lab/lib.sh
step "0. Install tools"
srun 'dnf install -y vim-enhanced tmux'
step "1. Probe vim in tmux"
run 'which vim'
run 'tmux new-session -d -s v -x 70 -y 12 "vim notes.txt"'
run 'sleep 1'
run 'tmux capture-pane -t v -p'
run 'tmux send-keys -t v i "Hello RHCSA" Escape'
run 'tmux capture-pane -t v -p'
run 'tmux send-keys -t v ":wq" Enter'
run 'sleep 1'
run 'cat notes.txt'
