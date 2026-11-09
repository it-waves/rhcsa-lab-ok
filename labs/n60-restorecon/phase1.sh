. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. A file with the wrong label"
run "echo hello > ~/note.txt"
run 'ls -Z ~/note.txt'
run 'sudo mv ~/note.txt /etc/note.txt'
run 'ls -Z /etc/note.txt'
step "2. The default label"
run 'matchpathcon /etc/note.txt'
step "3. Restore it"
run 'sudo restorecon -v /etc/note.txt'
run 'ls -Z /etc/note.txt'
step "4. A whole directory"
run 'mkdir ~/site'
run 'touch ~/site/index.html'
run 'sudo mv ~/site /srv/site'
run 'ls -dZ /srv/site /srv/site/index.html'
run 'sudo restorecon -Rv /srv/site'
run 'ls -dZ /srv/site /srv/site/index.html'
step "5. Clean up"
run 'sudo rm /etc/note.txt'
run 'sudo rm -r /srv/site'
