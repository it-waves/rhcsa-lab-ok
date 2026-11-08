. /tmp/lab/lib.sh
step "Task: confirm the lab, then make two changes that must survive a reboot"
run 'cat /etc/redhat-release'
run 'uname -r'
run 'lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS'
run 'getenforce'
step "Demo: set a persistent hostname and create a user"
srun 'hostnamectl set-hostname node1'
srun 'useradd -m -s /bin/bash labuser'
step "Check before reboot"
run 'hostnamectl --static'
run 'id labuser'
