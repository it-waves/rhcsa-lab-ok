. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
step "1. Create a user and set a password"
run 'sudo useradd alice'
run 'echo "Redhat#2026" | sudo passwd --stdin alice'
run 'sudo passwd -S alice'
step "2. Show the password aging"
run 'sudo chage -l alice'
step "3. Adjust the aging"
run 'sudo chage -M 90 alice'
run 'sudo chage -m 7 alice'
run 'sudo chage -W 14 alice'
run 'sudo chage -l alice'
step "4. Force a change at the next login"
run 'sudo passwd -e alice'
run 'sudo chage -l alice'
