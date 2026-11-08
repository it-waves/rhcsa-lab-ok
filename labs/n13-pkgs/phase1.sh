. /tmp/lab/lib.sh
step "1. Look before you install"
run 'rpm -q tree'
run 'dnf info tree'
run 'dnf search tree'
step "2. Install from a repository"
srun 'dnf -y install tree'
run 'rpm -q tree'
run 'tree --version'
step "3. See what a package installed"
run 'rpm -ql tree'
run 'rpm -qf /usr/bin/tree'
step "4. Install from a file"
run 'dnf download zip'
run 'ls zip-3.0-45.el10.x86_64.rpm'
srun 'dnf -y install ./zip-3.0-45.el10.x86_64.rpm'
run 'rpm -q zip'
step "5. Remove"
srun 'dnf -y remove tree'
run 'rpm -q tree'
run 'tree --version'
step "6. History"
srun 'dnf history'
step "7. Find the package for a file"
run 'rpm -q unzip'
run 'dnf provides /usr/bin/unzip'
