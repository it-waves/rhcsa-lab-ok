# Create, delete, and modify local groups and group memberships

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**The demo changes nothing silently.** It creates the groups `devs` (renamed to `developers`), `audit` and `temp` (deleted), and the users `alice` and `bob`. **One step is silent in the practice lab only:** before the practice check the lab creates the users `erin` and `frank` and the group `temp`. This is said in the video.

## Exam objective (exact wording)
Create, delete, and modify local groups and group memberships

## What the video covers
1. A local group is one line in `/etc/group`, shown with `getent group NAME`: name, password placeholder `x`, group ID, members.
2. `sudo groupadd NAME` creates a group; `-g` chooses the group ID.
3. `sudo usermod -aG GROUP USER` adds a user to a group. `-G` is the list of supplementary groups; `-a` appends. Without `-a` the user's other supplementary groups are replaced.
4. `id USER` shows the groups of a user (every new user also gets a private group with the user's name).
5. `sudo groupmod -n NEWNAME OLDNAME` renames a group (ID and members stay).
6. `sudo gpasswd -d USER GROUP` removes one member; `sudo groupdel NAME` deletes a group.
7. After a reboot the changes remain.

## Honest limits
- Not covered: `gpasswd -a`, group administrators and group passwords, `groupmod -g` (changing a group ID), `usermod -g` (primary group), `newgrp`, `groupdel` of a user's primary group, and `/etc/gshadow`.
- The group IDs (1001, 3000) and the private group ID 3001 are what this fresh image assigned; yours may differ.
- A user must log in again before a new group membership shows in an existing session.

## Sources
- The man pages on your own system: `man groupadd`, `man groupmod`, `man groupdel`, `man usermod`, `man gpasswd`, `man 5 group`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare the practice: `sudo useradd erin; sudo useradd frank; sudo groupadd temp` (one per line).
