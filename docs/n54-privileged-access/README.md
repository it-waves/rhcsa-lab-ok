# Configure privileged access

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. In the `sudo -l` captures, the long line of default settings is replaced on screen by `... default settings, not shown ...`.

**The demo changes nothing silently.** It creates the users `alice` and `bob`, adds `alice` to `wheel` and writes `/etc/sudoers.d/bob`. **One step is silent in the practice lab only:** before the practice check the lab creates the users `gina` and `hank`. This is said in the video.

**Lab image note:** the lab user `student` has full sudo without a password (set up by the lab image in `/etc/sudoers.d/90-cloud-init-users`, which also shows in `visudo -c`). On your own system sudo will normally ask for a password.

## Exam objective (exact wording)
Configure privileged access

## What the video covers
1. `sudo -l` lists what the current user may run; `sudo -l -U NAME` shows it for another user.
2. A sudo rule: who (`user` or `%group`), host, `(as which user)`, options such as `NOPASSWD:`, commands.
3. Full sudo: put the user in the group `wheel` (`sudo usermod -aG wheel NAME`); the rule `%wheel ALL=(ALL) ALL` is already in `/etc/sudoers`.
4. A rule for one command in a small file under `/etc/sudoers.d/`, mode `0440`, checked with `sudo visudo -c`.
5. A real test with `sudo -u bob sudo -n COMMAND`: the allowed command works, another command says a password is required.
6. After a reboot the rules remain.

## Honest limits
- The video writes the rule with `echo | sudo tee` so it can be shown. On a real system use `sudo visudo -f /etc/sudoers.d/NAME` (it checks the syntax before saving). A syntax error in a sudoers file can lock out sudo, so always run `sudo visudo -c`.
- Not covered: command aliases, `Defaults` options, `sudo -i`/`su`, sudo logging, `requiretty`, and sudoers `#includedir` details.
- `sudo -u bob sudo -n ...` is only a test trick for the video; the real way is to log in as the user.

## Sources
- The man pages on your own system: `man sudo`, `man sudoers`, `man visudo`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare the practice: `sudo useradd gina`, `sudo useradd hank` (one per line).
