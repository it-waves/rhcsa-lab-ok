# Configure access to Flatpak repositories

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The dnf transaction (108 packages) and the long `--show-details` line wrap are shortened or reflowed on screen.

## Exam objective (exact wording)
Configure access to Flatpak repositories

## What the video covers
1. A Flatpak repository is called a remote. The `flatpak` tool talks to remotes; installations are system-wide (`/var/lib/flatpak`, needs sudo) or per user (`--user`, `~/.local/share/flatpak`).
2. Install the tool: `sudo dnf -y install flatpak`, `flatpak --version`. Before any remote exists, `flatpak remotes` prints an error because the repository folder does not exist yet.
3. Add a remote: `sudo flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo`, then `flatpak remotes` and `flatpak remotes --show-details`.
4. Look inside: `flatpak remote-ls flathub --app | head -n 5`.
5. Turn it off and on: `sudo flatpak remote-modify --disable flathub` (disabled remotes are hidden), `flatpak remotes --show-disabled`, `sudo flatpak remote-modify --enable flathub`.
6. A remote for one user: `flatpak remote-add --user flathub URL`, no sudo.
7. Remove: `flatpak remote-delete --user flathub`, `sudo flatpak remote-delete flathub`. Then add the system one back.
8. Reboot step (remotes are stored on disk and survive), then the practice task and checker.

## Honest limits
- Not covered: installing and removing Flatpak applications (next video), updates, permissions, `flatpak remote-add --if-not-exists`, authenticated remotes.
- Flathub is used as the example address. The video does not show Red Hat's own Flatpak registry; check the RHEL 10 documentation and the current exam objectives for what your exam environment provides.
- Package versions and the package count come from Rocky Linux 10.2 and will differ on your system. The video needs internet access to Flathub.

## Sources
- The man pages on your own system: `man flatpak-remote-add`, `man flatpak-remotes`, `man flatpak-remote-modify`, `man flatpak-remote-delete`, `man flatpak-remote-ls`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `sudo flatpak remote-delete --force labhub`
