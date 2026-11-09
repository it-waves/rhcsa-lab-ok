# Configure firewall settings using firewall-cmd/firewalld

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. In the `list-all` capture, the empty fields after `ports:` are replaced on screen by `... empty fields, not shown ...`.

**One step is silent:** before the demo (and before the practice), the lab installs and starts firewalld (`sudo dnf install -y firewalld`, `sudo systemctl enable --now firewalld`), because this image does not have it. This is said in the video. **The demo changes the system:** it opens `http` at runtime, saves it, opens `8080/tcp` in the zone `public` and sets the default zone to `work`. To undo: `sudo firewall-cmd --set-default-zone=public`, then remove the rules you added (`--remove-service`, `--remove-port`, with `--permanent`).

## Exam objective (exact wording)
Configure firewall settings using firewall-cmd/firewalld

## What the video covers
1. Zones: `--get-default-zone`, `--get-active-zones`, `--list-all`.
2. Two copies of the rules: runtime (active now, lost on `--reload` or reboot) and permanent (saved on disk). By default `firewall-cmd` changes only the runtime copy.
3. `--add-service=http` at runtime; `--reload` removes it again.
4. `--runtime-to-permanent` saves the running rules (it replaces the saved rules with the running ones).
5. A permanent port in a named zone: `--permanent --zone=public --add-port=8080/tcp`, then `--reload`.
6. `--set-default-zone=work` (saved at once).
7. After a reboot the saved rules and the default zone remain.

## Honest limits
- Not covered: rich rules, port forwarding, masquerading, sources, custom services and zones, ICMP blocks, `--panic-on`.
- Cockpit (port 9090) is a default service in the public zone on this image; the practice task opens `9090/tcp` as a port anyway.

## Sources
- The man pages on your own system: `man firewall-cmd`, `man firewalld`, `man firewalld.zones`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). To prepare: `sudo dnf install -y firewalld`, then `sudo systemctl enable --now firewalld` (one per line).
