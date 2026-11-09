# Use Boolean settings to modify system SELinux settings

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Nothing is prepared silently.** The demo turns the boolean `httpd_enable_homedirs` on (until the next reboot, then permanently), reboots, and puts it back to off with `-P` in the last step. The web server itself is not installed or used.

## Exam objective (exact wording)
Use Boolean settings to modify system SELinux settings

## What the video covers
1. A boolean is an on or off switch in the SELinux policy (for example `httpd_enable_homedirs`, `httpd_can_network_connect`).
2. `getsebool name` reads one boolean; `getsebool -a | grep httpd_enable` lists many; `sudo semanage boolean -l | grep ...` adds a description and two values in brackets: (current , default).
3. `sudo setsebool name on` changes it until the next reboot; the list then shows (on , off).
4. `sudo setsebool -P name on` saves it (it takes a few seconds); the list shows (on , on), and `semanage boolean -l -C` lists only the booleans you changed.
5. After a reboot the saved value is still on. Put it back with `sudo setsebool -P name off`; the entry stays in the `-C` list, now as (off , off), the same as the default.

## Honest limits
- Not covered: finding the boolean you need (`semanage boolean -l` with grep on the description, or the man page `man httpd_selinux` if the selinux-policy-doc package is installed), or `getsebool -a` in full.
- The default values and the list of booleans come from the policy of the system you use.

## Sources
- The man pages on your own system: `man getsebool`, `man setsebool`, `man semanage-boolean`, `man selinux`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
