#!/usr/bin/env bash
# DevOps Simplified HQ: RHCSA lab validation (read-only). Run on each lab VM as your normal user, then again with sudo.
# Usage: ./lab-check.sh [peer-hostname-or-ip]   (writes lab-check-<host>.txt in the current directory)
# It changes nothing: it only runs commands that read system state.
PEER="${1:-}"
OUT="lab-check-$(hostname -s).txt"
run() { printf '\n$ %s\n' "$*"; "$@" 2>&1 || printf '[exit status %s]\n' "$?"; }
sh_run() { printf '\n$ %s\n' "$1"; bash -c "$1" 2>&1 || printf '[exit status %s]\n' "$?"; }
{
  echo "== lab-check $(date -Is) user=$(id -un) uid=$(id -u) =="
  run cat /etc/redhat-release
  sh_run "grep -E '^(NAME|VERSION_ID|PRETTY_NAME)=' /etc/os-release"
  run uname -r
  run hostnamectl
  sh_run "/lib64/ld-linux-x86-64.so.2 --help | grep -E 'x86-64-v[0-9]'"
  run nproc
  run free -h
  run lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINTS
  run ip -br address
  run ip route
  run getenforce
  sh_run "systemctl is-active firewalld chronyd sshd"
  sh_run "sudo -n subscription-manager status || echo 'run with sudo to see subscription status'"
  sh_run "sudo -n dnf repolist || echo 'run with sudo to list repositories'"
  [ -n "$PEER" ] && run ping -c 3 "$PEER"
} | tee "$OUT"
echo; echo "Saved to $OUT. Send this file back; it contains hostnames and IPs but no passwords."
