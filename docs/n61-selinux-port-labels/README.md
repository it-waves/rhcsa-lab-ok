# Manage SELinux port labels

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Nothing is prepared silently.** The `semanage` command comes from the package `policycoreutils-python-utils`, which was already installed on the lab machine. If it is missing on your system: `sudo dnf install policycoreutils-python-utils`. The demo adds port labels for tcp 8888 and tcp 8080 and removes them again in the last step.

## Exam objective (exact wording)
Manage SELinux port labels

## What the video covers
1. A service may only use ports whose type matches it: the web server (`httpd_t`) may use ports of the type `http_port_t`.
2. `sudo semanage port -l | grep '^http_port_t'` lists the ports of a type; `grep -w 8080` finds the label of one port (`-w` = whole word).
3. `sudo semanage port -a -t http_port_t -p tcp 8888` adds a port to a type (`-t` type, `-p` protocol); `-l -C` lists only the local changes.
4. A port that already has a label (8080 is `http_cache_port_t`): on this version `-a` answers "already defined, modifying instead"; `-m` modifies explicitly.
5. `-d` deletes the local change; 8080 goes back to its original label.

## Honest limits
- The video does not start a real web server on the new port (the web server is not installed in the demo). It shows the label work only.
- Not covered: the firewall for the new port (the firewall video covers that), `semanage port -E`, or reading the audit log for a denied bind.
- On other versions of semanage, `-a` on a port that already has a label may give an error instead of modifying; then use `-m`.
- The port lists come from the policy of the system you use; yours may differ slightly.

## Sources
- The man pages on your own system: `man semanage-port`, `man semanage`, `man selinux`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
