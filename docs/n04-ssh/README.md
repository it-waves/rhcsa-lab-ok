# Access remote systems using SSH

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited.

## Exam objective (exact wording)
Access remote systems using SSH

## About the lab (not the objective)
- The lab has one machine, so the video connects to `localhost`, which means this same machine. For a real server, use its name or address instead; nothing else changes.
- The first time you connect to a new machine, `ssh` asks you to confirm its fingerprint (type `yes`), then asks for the password. The video is recorded by a script with no keyboard, so the lab pre-trusts the machine and logs in with a key. Keys get their own video later in the course.
- To follow along the simple way: skip the key, run the commands, type `yes` at the fingerprint question and your password when asked.
- To match the video exactly, run these once, one at a time (press Enter at each question of the first command):

```
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-keyscan localhost >> ~/.ssh/known_hosts
```

## What the video covers
1. The shape of the command: `ssh user@host command`. No command after the host means an interactive login.
2. Run a command on the remote machine: `ssh student@localhost hostname`; leave out the user and `ssh` uses your current user; `whoami` shows which user you are over there.
3. `-p` chooses the port (the default is 22).
4. `scp` copies files over SSH: source first, then destination; a remote file as the source downloads it.
5. Errors: "Could not resolve hostname" (wrong name) and "Permission denied" (the machine answered, the login was refused).
6. Reboot step, then the practice task and checker.

## Honest limits
- The video cannot show an interactive login or a password prompt, because the recording script has no keyboard. Try `ssh localhost` yourself and type `exit` to leave.

## Sources
- The man pages on your own system: `man ssh`, `man scp`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab5 hello.txt copy.txt` and `rm -f /tmp/hello.txt`.
