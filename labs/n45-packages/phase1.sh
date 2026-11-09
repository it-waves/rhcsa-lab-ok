. /tmp/lab/lib.sh
sudo systemctl is-system-running --wait >/dev/null 2>&1
sudo dnf -y -q install dnf-plugins-core >/dev/null 2>&1
sudo dnf -y -q remove tree >/dev/null 2>&1
step "1. Which repositories are enabled?"
run 'dnf repolist'
step "2. Install from a remote repository"
run 'sudo dnf install -y tree'
run 'rpm -q tree'
step "3. Update a package"
run 'sudo dnf upgrade -y tree'
step "4. Install from a file on disk"
run 'sudo dnf remove -y tree'
run 'dnf download tree'
run 'ls tree*.rpm'
run 'sudo dnf install -y ./tree*.rpm'
run 'rpm -q tree'
