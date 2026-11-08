# Configure access to RPM repositories

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The dnf install output is shortened on screen, and so is the long `dnf repolist --all` list.

## Exam objective (exact wording)
Configure access to RPM repositories

## What the video covers
1. A repository is a folder or web address holding RPM files plus a catalog (`repodata`). A `.repo` file in `/etc/yum.repos.d` tells dnf where it is.
2. `ls /etc/yum.repos.d`, and `head -n 12 /etc/yum.repos.d/rocky.repo`: the `[id]` in brackets starts each repository.
3. `dnf repolist` (enabled repositories) and `dnf repolist --all` (disabled too).
4. Build a local repository: `sudo dnf -y install createrepo_c`, `mkdir localrepo`, `dnf download --destdir localrepo tree`, `createrepo_c localrepo`.
5. Add it: `sudo dnf config-manager --add-repo file:///home/student/localrepo` (creates `home_student_localrepo.repo`).
6. Check it: `dnf repoinfo ID`, `dnf --repo=ID list available`.
7. Turn off and on: `--set-disabled ID`, `--set-enabled ID`.
8. `gpgcheck`: `--save --setopt=ID.gpgcheck=0` for this lab repository only.
9. Reboot step (the file survives), then the practice task and checker.

## Honest limits
- Not covered: writing a `.repo` file by hand in an editor (the result is the same file shown with `cat`), `gpgkey` and `repo_gpgcheck`, mirror lists, `priority`, subscription-manager and Red Hat CDN registration.
- The exam machine may point at its own repository URL; the idea is the same: a `.repo` file with a `baseurl`. Check the current objective list before you book.
- `dnf config-manager` comes from the dnf-plugins-core package. Whether it is installed on a fresh RHEL 10 install depends on the install; the lab here is Rocky Linux 10.2.

## Sources
- The man pages on your own system: `man dnf`, `man dnf.conf`, `man dnf-config-manager` (or `dnf config-manager --help`), `man createrepo_c`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `sudo rm /etc/yum.repos.d/home_student_lab12repo.repo; rm -rf lab12repo`
