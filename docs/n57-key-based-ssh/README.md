# Configure key-based authentication for SSH

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. The "server" in the demo is the same machine (`localhost`); on the exam it will be another host.

**Silent setup, said in the video.** Before the demo the lab (1) creates the user `olga` with a password, (2) turns on password login for sshd with a drop-in `/etc/ssh/sshd_config.d/10-lab-password.conf` containing `PasswordAuthentication yes` (this image has it off) and reloads sshd, and (3) makes ssh answer the password prompt automatically (a small `SSH_ASKPASS` helper set in the student's `~/.bashrc`). Without this, `ssh-copy-id` would wait for you to type olga's password; in real life you type it yourself. The practice lab does the same for the user `pat`. The demo also creates `~/.ssh/id_ed25519` for `student`, and the key pair `~/.ssh/pat_key` in the practice.

The key is created with an empty passphrase (`-N ''`) only so the lab can run without typing. **On a real system, set a passphrase.**

## Exam objective (exact wording)
Configure key-based authentication for SSH

## What the video covers
1. A key pair: the private key stays on the client, the public key goes into `~/.ssh/authorized_keys` of the user on the server.
2. `ssh-keygen -q -t ed25519 -N '' -f ~/.ssh/id_ed25519` and what each option does; the private key is mode 600.
3. `ssh-copy-id user@host` logs in once with a password and installs the public key.
4. On the server: `~/.ssh` is 700 and `authorized_keys` is 600 (SSH refuses keys when the permissions are too open).
5. `ssh -o BatchMode=yes user@host command` proves the key works (no password prompt is allowed).
6. After a reboot key login still works.

## Honest limits
- Not covered: `ssh-agent` and `ssh-add`, `~/.ssh/config`, disabling password login (`PasswordAuthentication no`) and root login, host keys and `known_hosts`, SELinux labels on `~/.ssh` (`restorecon -R ~/.ssh` if you copy keys by hand), certificates.
- If you copy the key by hand instead of `ssh-copy-id`, the folder and file permissions above and the SELinux labels are your job.

## Sources
- The man pages on your own system: `man ssh-keygen`, `man ssh-copy-id`, `man sshd_config`, `man ssh`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare the practice by hand you need a second user with a password and password login enabled for sshd; the lab runner does this silently.
