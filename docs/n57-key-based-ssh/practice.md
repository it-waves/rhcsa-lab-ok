# Practice task: key-based authentication for SSH

Work as `student`, in a virtual machine. Prepare: a user `pat` with a password, and sshd that allows password login for the first copy (`PasswordAuthentication yes`, then `sudo systemctl reload sshd`).

**Task.**

1. As `student`, create a key pair named `~/.ssh/pat_key` (type ed25519).
2. Copy its public key to `pat@localhost`.
3. Check that `ssh -i ~/.ssh/pat_key pat@localhost` works without a password.
4. Run the checker (`bash check.sh`), reboot, and run it again.

The solution is in `solution.md`. Try first.
