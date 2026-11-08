#!/usr/bin/env bash
# usage: run-lab.sh <lab-name>   (run from repo root after the VM is up on :2222)
set -u
LAB=$1; O="-i lab/key -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=ERROR"
S="ssh $O -p 2222 student@127.0.0.1"; mkdir -p out
ssh_wait(){ for i in $(seq 1 90); do $S true 2>/dev/null && return 0; sleep 5; done; return 1; }
$S 'mkdir -p /tmp/lab; sudo hostnamectl set-hostname node1'
scp $O -P 2222 labs/lib.sh labs/$LAB/phase*.sh student@127.0.0.1:/tmp/lab/
{
  echo "# Rocky Linux 10 (RHEL-compatible rebuild, NOT Red Hat Enterprise Linux) - lab $LAB"
  $S 'bash /tmp/lab/phase1.sh'
  echo; echo "===== reboot ====="; echo "[student@node1 ~]$ sudo systemctl reboot"
  $S 'sudo systemctl reboot' || true
  sleep 20; ssh_wait || { echo "VM did not come back"; exit 1; }
  $S 'bash /tmp/lab/phase2.sh'
} 2>&1 | tee out/$LAB.txt
