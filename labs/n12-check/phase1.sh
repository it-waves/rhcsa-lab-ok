. /tmp/lab/lib.sh
step "Solution"
srun 'dnf -y install createrepo_c'
run 'mkdir lab12repo'
run 'dnf download --destdir lab12repo zip'
run 'createrepo_c lab12repo'
srun 'dnf config-manager --add-repo file:///home/student/lab12repo'
step "Checker"
run 'bash /tmp/lab/check.sh'
run 'dnf --repo=home_student_lab12repo list available'
