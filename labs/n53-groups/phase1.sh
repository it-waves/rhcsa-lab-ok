. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Create groups"
run 'sudo groupadd devs'
run 'getent group devs'
run 'sudo groupadd -g 3000 audit'
run 'getent group audit'
step "2. Add users to a group"
run 'sudo useradd alice'
run 'sudo useradd bob'
run 'sudo usermod -aG devs alice'
run 'sudo usermod -aG devs bob'
run 'getent group devs'
run 'id alice'
step "3. Rename a group"
run 'sudo groupmod -n developers devs'
run 'getent group developers'
step "4. Remove a member"
run 'sudo gpasswd -d bob developers'
run 'getent group developers'
step "5. Delete a group"
run 'sudo groupadd temp'
run 'sudo groupdel temp'
run 'getent group temp'
