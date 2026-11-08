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
srun 'dnf config-manager --add-repo file:///home/student/localrepo'
run 'ls /etc/yum.repos.d'
run 'cat /etc/yum.repos.d/home_student_localrepo.repo'
run 'dnf repolist'
step "5. Check what it offers"
run 'dnf repoinfo home_student_localrepo'
run 'dnf --repo=home_student_localrepo list available'
step "6. Disable and enable"
srun 'dnf config-manager --set-disabled home_student_localrepo'
run 'dnf repolist'
srun 'dnf config-manager --set-enabled home_student_localrepo'
run 'dnf repolist'
step "7. Gpgcheck"
srun 'dnf config-manager --save --setopt=home_student_localrepo.gpgcheck=0'
run 'cat /etc/yum.repos.d/home_student_localrepo.repo'
srun 'dnf config-manager --dump home_student_localrepo'
