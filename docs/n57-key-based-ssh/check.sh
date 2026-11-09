#!/usr/bin/env bash
# N57 practice-task checker. Read-only apart from known_hosts on the first ssh.
fail=0
if [ -f ~/.ssh/pat_key ] && [ -f ~/.ssh/pat_key.pub ]; then echo "PASS: the key pair ~/.ssh/pat_key exists"; else echo "FAIL: the key pair ~/.ssh/pat_key is missing"; fail=1; fi
if sudo grep -q "$(cut -d' ' -f2 ~/.ssh/pat_key.pub 2>/dev/null || echo none)" /home/pat/.ssh/authorized_keys 2>/dev/null; then echo "PASS: the public key is in /home/pat/.ssh/authorized_keys"; else echo "FAIL: the public key is not in /home/pat/.ssh/authorized_keys"; fail=1; fi
if timeout 30 ssh -i ~/.ssh/pat_key -o IdentitiesOnly=yes -o BatchMode=yes -o StrictHostKeyChecking=accept-new pat@localhost true 2>/dev/null; then echo "PASS: ssh as pat works with the key, no password"; else echo "FAIL: ssh as pat with the key does not work"; fail=1; fi
exit $fail
