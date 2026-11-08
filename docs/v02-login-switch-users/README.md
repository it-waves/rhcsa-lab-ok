# V02 - Log in and switch users in multi-user targets

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Log in and switch users in multi-user targets

## What the video covers
1. The target: `systemctl get-default`, `systemctl is-active multi-user.target`.
2. Lab preparation (not the objective): a second user `alice` and an SSH key.
3. `su alice` versus `su - alice` (login shell), and `-c` for one command.
4. `sudo -u`, `sudo -i`, `sudo whoami`.
5. Logging in as another user over SSH with a key.
6. Reboot step, then the practice task and checker.

## Honest limits
- Interactive `su` asks for the target user's password when a regular user runs it. The lab runner has no terminal to type one, so the video runs `su` through `sudo`. Try the interactive form yourself after creating a password for `alice`.
- This lab allows `sudo` without a password. Many systems ask for your own password.

## Sources
- The man pages on your own system: `man su`, `man sudo`, `man ssh`, `man systemd.special`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Preparation for this video, run once: `sudo useradd -m alice`. For the SSH step, create a key with `ssh-keygen -t ed25519`, then copy the public key into `/home/alice/.ssh/authorized_keys` (directory mode 700, file mode 600, owned by alice). Reset: `sudo userdel -r alice`.
