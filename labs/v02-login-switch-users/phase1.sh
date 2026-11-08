. /tmp/lab/lib.sh
step "1. Who am I, and which target is the system in"
run 'whoami'
run 'id'
run 'systemctl get-default'
run 'systemctl is-active multi-user.target'
step "2. Lab preparation: a second user (not the objective)"
run 'sudo useradd -m alice && id alice'
run 'ssh-keygen -q -t ed25519 -N "" -f ~/.ssh/id_ed25519 && echo key created'
run 'sudo install -d -m 700 -o alice -g alice /home/alice/.ssh && sudo install -m 600 -o alice -g alice ~/.ssh/id_ed25519.pub /home/alice/.ssh/authorized_keys && echo key installed for alice'
step "3. su: switch user without and with a login shell"
run 'cd /tmp && sudo su alice -c "whoami; pwd; echo \$HOME"'
run 'cd /tmp && sudo su - alice -c "whoami; pwd; echo \$HOME"'
step "4. sudo: run one command as another user, or open root"
run 'sudo -u alice id'
run 'sudo -i id'
run 'sudo whoami'
step "5. Log in as another user over SSH"
run 'ssh -o StrictHostKeyChecking=accept-new alice@localhost "whoami; hostname; pwd"'
run 'last -n 3'
step "Practice task, solved (not shown in the video)"
run 'sudo su - alice -c "touch ~/lab2.txt"'
run 'sudo ls -l /home/alice/lab2.txt'
