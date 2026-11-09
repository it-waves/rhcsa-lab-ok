. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
printf '#!/bin/bash\necho deploy ok\n' > deploy.sh
chmod 644 deploy.sh
sudo mkdir -p /srv/proj/reports
echo 'q3 numbers' | sudo tee /srv/proj/reports/q3.txt >/dev/null
sudo chmod 700 /srv/proj/reports
sudo chmod 600 /srv/proj/reports/q3.txt
step "1. A script that will not run"
run './deploy.sh'
run 'ls -l deploy.sh'
run 'chmod u+x deploy.sh'
run './deploy.sh'
step "2. A file we cannot read"
run 'cat /srv/proj/reports/q3.txt'
run 'namei -l /srv/proj/reports/q3.txt'
run 'sudo chmod 755 /srv/proj/reports'
run 'cat /srv/proj/reports/q3.txt'
run 'ls -l /srv/proj/reports/q3.txt'
run 'sudo chown student /srv/proj/reports/q3.txt'
run 'cat /srv/proj/reports/q3.txt'
