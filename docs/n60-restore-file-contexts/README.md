# Restore default file contexts

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Nothing is prepared silently in the demo.** It creates `~/note.txt` and `~/site`, moves them to `/etc/note.txt` and `/srv/site`, restores their labels, and removes them again in the last step. The practice lab needs a preparation step: `setup.sh` creates `/etc/practice.conf` with a wrong label (you run it yourself, and you can read it first).

## Exam objective (exact wording)
Restore default file contexts

## What the video covers
1. Why a label goes wrong: a new file gets the label of the place where it is created; `mv` keeps the old label; a restore from a backup can bring old labels back.
2. `matchpathcon /etc/note.txt` prints the default context from the policy (shows only, changes nothing).
3. `sudo restorecon -v /etc/note.txt` applies the default; `-v` says what changed (Relabeled ... from user_home_t to etc_t).
4. `sudo restorecon -Rv /srv/site` does a whole directory tree (`-R`); the default for `/srv` is `var_t`.

## Honest limits
- Not covered: changing the default itself (`semanage fcontext`, the next kind of task), `chcon`, `restorecon -n` (dry run), or relabeling the whole system (`touch /.autorelabel`).
- The default labels come from the policy of the system you use; on RHEL 10 they match the ones shown here for these paths.

## Sources
- The man pages on your own system: `man restorecon`, `man matchpathcon`, `man selinux`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `setup.sh`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
