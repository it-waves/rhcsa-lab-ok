. /tmp/lab/lib.sh
step "1. Where repository files live"
run 'ls /etc/yum.repos.d'
run 'head -n 12 /etc/yum.repos.d/rocky.repo'
step "2. List repositories"
run 'dnf repolist'
run 'dnf repolist --all'
step "3. Build a local repository"
srun 'dnf -y install createrepo_c'
run 'mkdir localrepo'
run 'dnf download --destdir localrepo tree'
run 'createrepo_c localrepo'
run 'ls localrepo'
step "4. Add the repository"
srun 'dnf config-manager addrepo --id=lab --set=name="Local lab repo" --set=baseurl=file:///home/student/localrepo --set=gpgcheck=0'
run 'ls /etc/yum.repos.d'
run 'cat /etc/yum.repos.d/lab.repo'
run 'dnf repolist'
step "5. Check what it offers"
run 'dnf repoinfo lab'
step "6. Disable and enable"
srun 'dnf config-manager setopt lab.enabled=0'
run 'dnf repolist'
srun 'dnf config-manager setopt lab.enabled=1'
run 'dnf repolist'
