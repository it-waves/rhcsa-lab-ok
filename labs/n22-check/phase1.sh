. /tmp/lab/lib.sh
step "Before: root is locked on the cloud image"
run 'bash /tmp/lab/check.sh'
step "CI stand-in for the console steps"
srun "echo 'root:Lab-Only-2026' | chpasswd"
