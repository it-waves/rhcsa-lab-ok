# Install and update software packages from Red Hat Content Delivery Network, a remote repository, or from the local file system

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. Long dnf output is shortened on screen and marked with `...`.

**The Red Hat Content Delivery Network step is not demonstrated.** On RHEL, the main repositories are on the Red Hat CDN and a system gets access after it is registered with `subscription-manager`. This lab has no subscription; it uses Rocky Linux's own public repositories. The `dnf` commands are the same.

**Important lab note:** before the demo, the lab (not shown) installs `dnf-plugins-core` (it provides `dnf download`) and removes the `tree` package. These steps change the system.

## Exam objective (exact wording)
Install and update software packages from Red Hat Content Delivery Network, a remote repository, or from the local file system

## What the video covers
1. Software comes as RPM packages; dnf installs them from repositories listed in `/etc/yum.repos.d`.
2. `dnf repolist` lists enabled repositories (here: appstream, baseos, extras).
3. `sudo dnf install -y tree` installs from a remote repository; `rpm -q tree` shows the installed version.
4. `sudo dnf upgrade -y tree` updates one package ("Nothing to do" when it is the newest); without a name it updates everything.
5. `sudo dnf remove -y tree`, `dnf download tree` (saves the .rpm in the current folder), `ls tree*.rpm`.
6. `sudo dnf install -y ./tree*.rpm` installs from a file on disk; the repository column shows `@commandline`.
7. After a reboot the package is still installed.

## Honest limits
- Not covered: `subscription-manager register` and attaching subscriptions (needs a Red Hat account), `dnf config-manager`, writing a `.repo` file by hand, building a local repository with `createrepo_c`, `rpm -i` and `rpm -U`, `dnf history`, module streams, and GPG key handling.
- The upgrade demo shows "Nothing to do": the package was already the newest.
- The checker reads state only.

## Sources
- The man pages on your own system: `man dnf`, `man rpm`, `man dnf.conf`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
