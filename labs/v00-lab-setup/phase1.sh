. /tmp/lab/lib.sh
step "Check 1: the system and its resources"
run 'cat /etc/redhat-release'
run 'nproc'
run 'free -h'
run '/lib64/ld-linux-x86-64.so.2 --help | grep supported'
step "Check 2: the two extra practice disks"
run 'lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS | grep -E "^(NAME|vd[a-c])"'
step "Check 3: security and services"
run 'getenforce'
run 'systemctl is-active chronyd sshd'
step "Persistence test: make two changes"
srun 'hostnamectl set-hostname node1.lab.example'
srun 'useradd -m -s /bin/bash labuser'
run 'hostnamectl --static'
run 'id labuser'
