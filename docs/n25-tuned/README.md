# Manage tuning profiles

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited, except that the long `dnf install` output is shortened on screen (the video says so).

## Exam objective (exact wording)
Manage tuning profiles

## What the video covers
1. `tuned` is a service that applies a tuning profile: a named set of system settings made for a job.
2. `rpm -q tuned` checks whether it is installed; `sudo dnf install -y tuned` adds it. On the lab image it came with 69 helper packages and enabled the service.
3. `sudo systemctl enable --now tuned` starts the service now and at every boot; `systemctl is-active tuned` confirms.
4. `tuned-adm active` shows the profile in use (here `virtual-guest`); `tuned-adm recommend` suggests the best one for this machine; `tuned-adm list` lists all profiles.
5. `sudo tuned-adm profile NAME` switches profile (the video uses `throughput-performance`).
6. The choice is saved in `/etc/tuned/active_profile`, so it survives a reboot.
7. Switching back to the recommended profile: `sudo tuned-adm profile virtual-guest`.

## Honest limits
- The profile list depends on the installed packages and the machine; yours may differ.
- `tuned-adm verify` reported "Verification failed" on the lab VM, so it is not shown in the video. Do not rely on it as a pass/fail test.
- Not covered: writing custom profiles under `/etc/tuned/`, `tuned-adm profile_info`, and profile includes.
- The checker looks at the result: tuned running, enabled at boot, and the active profile `powersave`. Run it after the reboot too.

## Sources
- The man pages on your own system: `man tuned-adm`, `man tuned`, `man tuned-profiles`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
