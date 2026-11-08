# Install and remove RPM software packages

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The dnf transaction output, the `dnf info` and `dnf search` listings and the repository metadata lines are shortened on screen.

## Exam objective (exact wording)
Install and remove RPM software packages

## What the video covers
1. Two tools: `rpm` queries the database of installed packages; `dnf` finds packages in repositories, downloads them and installs their dependencies.
2. Look first: `rpm -q tree` (installed?), `dnf info tree`, `dnf search tree`.
3. Install: `sudo dnf -y install tree`, then `rpm -q tree` and `tree --version`.
4. What a package installed: `rpm -ql tree` (files), `rpm -qf /usr/bin/tree` (which package owns a file).
5. Install from a file: `dnf download zip`, then `sudo dnf -y install ./zip-3.0-45.el10.x86_64.rpm`. The dependency `unzip` is installed too.
6. Remove: `sudo dnf -y remove tree`; `rpm -q tree` then says it is not installed.
7. `sudo dnf history` lists every change.
8. `dnf provides /usr/bin/unzip` finds the package that supplies a file (`@System` = already installed).
9. Reboot step (installed packages survive), then the practice task and checker.

## Honest limits
- Not covered: `rpm -i` / `rpm -e` (they do not resolve dependencies; use dnf), `dnf upgrade`, `dnf history undo`, package groups, modules, signature checking in detail.
- Package versions on screen come from Rocky Linux 10.2 and will differ on your RHEL 10 release. `dnf download` needs the dnf plugins package; on RHEL the same command works when the plugins are installed.
- The zip file name `zip-3.0-45.el10.x86_64.rpm` is the one the lab downloaded; yours may differ. Use the name `ls` shows.

## Sources
- The man pages on your own system: `man dnf`, `man rpm`, `man dnf-download` or `dnf download --help`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `sudo dnf -y remove telnet tree`, `rm -rf lab13`
