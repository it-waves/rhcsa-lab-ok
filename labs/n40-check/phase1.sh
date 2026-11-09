. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
printf '#!/bin/bash\necho run ok\n' > run.sh
chmod 644 run.sh
sudo mkdir -p /srv/data/private
echo 'plan ok' | sudo tee /srv/data/private/plan.txt >/dev/null
sudo chmod 700 /srv/data/private
sudo chmod 640 /srv/data/private/plan.txt
step "Check before the task"
run 'bash /tmp/lab/check.sh'
step "Solve it"
run 'chmod u+x run.sh'
run 'sudo chmod 755 /srv/data/private'
run 'sudo chown student /srv/data/private/plan.txt'
run './run.sh'
run 'cat /srv/data/private/plan.txt'
run 'bash /tmp/lab/check.sh'
