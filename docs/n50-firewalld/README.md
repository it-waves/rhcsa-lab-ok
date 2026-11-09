# Restrict network access using firewalld and firewall-cmd

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**One step is done silently before the demo:** the lab installs the `firewalld` package (`sudo dnf install -y -q firewalld`), because this practice image does not include it. A normal RHEL system has it installed already. This is said in the video. The demo itself changes the system: it starts and enables firewalld, allows `http` and port `8080/tcp`, and removes `cockpit`.

## Exam objective (exact wording)
Restrict network access using firewalld and firewall-cmd

## What the video covers
1. firewalld is the firewall service, `firewall-cmd` its command. Anything not allowed is blocked. You allow by service name (a named port) or by port number.
2. Running rules versus permanent rules: `--permanent` changes only the saved rules; `--reload` copies them into the running firewall.
3. `systemctl is-active firewalld`, `sudo systemctl enable --now firewalld`, `sudo firewall-cmd --state`.
4. `sudo firewall-cmd --list-services` and `--list-ports`.
5. `--permanent --add-service=http`, `--permanent --add-port=8080/tcp`, `--permanent --remove-service=cockpit`, each followed by `--reload`.
6. After a reboot the permanent changes remain.

## Honest limits
- Only the default zone (the one shown by `--list-services`) is used. Not covered: zones and `--zone`, rich rules, `--get-default-zone`, `--set-default-zone`, source addresses, port forwarding, masquerading, and the runtime-only (no `--permanent`) workflow including `--runtime-to-permanent`.
- The first line `Waiting on dbus connection...` printed by `firewall-cmd --state` is real output from the first call right after starting the service.
- The demo leaves `http`, `8080/tcp` allowed and `cockpit` removed; undo with `--permanent --remove-service=http`, `--permanent --remove-port=8080/tcp`, `--permanent --add-service=cockpit` and a reload.
- The checker uses `sudo firewall-cmd` and only reads state.

## Sources
- The man pages on your own system: `man firewall-cmd`, `man firewalld`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). If firewalld is missing: `sudo dnf install firewalld`.
