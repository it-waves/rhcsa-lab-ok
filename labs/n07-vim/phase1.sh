. /tmp/lab/lib.sh
srun 'dnf install -y vim-enhanced tmux python3-pip >/dev/null 2>&1; rpm -q tmux'
step "P1 plain tmux foreground with script"
run 'export TERM=xterm-256color; script -qc "tmux -f /dev/null new-session -d -s a -x 70 -y 12 \"vim notes.txt\"; sleep 1; tmux capture-pane -t a -p" /dev/null'
step "P2 tmux -v"
run 'export TERM=xterm-256color; tmux -f /dev/null -L b new-session -d -s b -x 70 -y 12 "sleep 30"; echo rc=$?; tmux -L b ls; ls -la /tmp/tmux-1000; getenforce'
step "P3 pip pyte"
run 'pip install --user pyte 2>&1 | tail -2'
