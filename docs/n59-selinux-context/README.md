# List and identify SELinux file and process context

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Nothing is prepared silently.** The demo only reads contexts; it changes nothing on the system. The practice task asks you to create one file, `~/context.txt`.

## Exam objective (exact wording)
List and identify SELinux file and process context

## What the video covers
1. A context is a label with four fields separated by colons: user, role, type, level. The type (third field) is the one to read.
2. `ls -Z` shows the context of files; `ls -dZ` shows a directory itself (`-d` = the directory, not its contents). Examples: `passwd_file_t`, `shadow_t`, `var_log_t`, `user_home_dir_t`.
3. `ps -Z` shows the context of processes; `-C` selects a process by command name (`ps -Z -C sshd` gives `sshd_t`, `ps -Z -C crond` gives `crond_t`).
4. `id -Z` shows your own context (`unconfined_t` for this login); `ps -Z` alone lists your own processes.

## Honest limits
- Not covered: changing contexts (`chcon`, `semanage fcontext`, `restorecon`; the next videos), `ls -Z` options such as `-lZ`, `ps auxZ`, or reading audit logs.
- The exact contexts you see depend on the system; on a real RHEL 10 system, `ls -Z /etc/shadow` also gives `shadow_t`.

## Sources
- The man pages on your own system: `man ls`, `man ps`, `man id`, `man selinux`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
