# Practice task: restore a default context

Work as `student`, in a virtual machine.

**Preparation.** Run `bash setup.sh`. It creates `/etc/practice.conf` and shows its label; the type is wrong (`user_home_t`).

**Task.** Restore the default SELinux context of `/etc/practice.conf`. Then run the checker: `bash check.sh`.

The solution is in `solution.md`. Try first.
