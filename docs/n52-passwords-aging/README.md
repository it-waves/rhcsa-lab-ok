# Change passwords and adjust password aging for local user accounts

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**The demo changes nothing silently.** It creates the user `alice`, sets a demo password, changes the aging rules and forces a password change. **One step is silent in the practice lab only:** before the practice check the lab runs `sudo useradd dave`, so the user exists. This is said in the video.

## Exam objective (exact wording)
Change passwords and adjust password aging for local user accounts

## What the video covers
1. Password aging: minimum days (`-m`), maximum days (`-M`), warning days (`-W`).
2. `passwd` sets or changes a password. In the video the password is sent with `--stdin` so it can be shown; normally you run `sudo passwd NAME` and type it twice. `--stdin` leaves the password on screen and in the shell history: use it only in a lab or script.
3. `sudo passwd -S NAME` shows the status (`P` = password set), the last change date and the aging numbers.
4. `sudo chage -l NAME` lists the rules in plain words; `chage -M`, `-m`, `-W` change them.
5. `sudo passwd -e NAME` expires the password so the user must pick a new one at the next login.
6. After a reboot the rules remain.

## Honest limits
- Not covered: `chage -I` (inactive days) and `-E` (account expiry date), `passwd -l`/`-u` (lock and unlock), `/etc/login.defs` defaults, password quality rules, and `/etc/shadow` fields.
- The dates shown (Nov 09, 2026, Feb 07, 2027) are from the day the lab ran; yours will differ.
- The line `passwd: password changed.` printed by `passwd -e` is real output on this system; wording may differ on other versions.

## Sources
- The man pages on your own system: `man passwd`, `man chage`, `man 5 shadow`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare the practice: `sudo useradd dave`.
