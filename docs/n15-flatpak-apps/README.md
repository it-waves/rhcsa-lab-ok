# Install and remove Flatpak software packages

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited, except that blank lines, download progress bars, the permissions block and most search results are left out on screen.

## Exam objective (exact wording)
Install and remove Flatpak software packages

## What the video covers
1. An app and its runtime: a Flatpak app uses a shared runtime. Installing the app installs the runtime; removing the app leaves the runtime behind.
2. Search: `flatpak search calculator` finds nothing until the search data is downloaded with `sudo flatpak update --appstream`. Columns: name, description, application id, version, branch, remote.
3. Install: `sudo flatpak install -y flathub org.gnome.Calculator` (remote, then application id; `-y` answers yes; `sudo` = system-wide). The plan has 7 items for a 2 MB app.
4. What is installed: `flatpak list`, `flatpak list --app`, `flatpak info org.gnome.Calculator`.
5. Remove: `sudo flatpak uninstall -y org.gnome.Calculator`. The app is gone but `flatpak list` still shows runtimes.
6. Clean up: `sudo flatpak uninstall -y --unused` removes runtimes no app needs.
7. Install again, reboot, and `flatpak list --app` still shows the app. Then the practice task and checker.

## Honest limits
- Not covered: running apps (the lab has no desktop), updates (`flatpak update`), per-user installs of apps, permissions (`flatpak override`), installing from a `.flatpakref` file or a local bundle, pinning versions.
- The application, runtime versions and sizes come from Flathub on the day the lab ran and will differ later. The install needs internet access and downloads several hundred megabytes.
- The video does not show Red Hat's own Flatpak registry; check the RHEL 10 documentation and the current exam objectives for what your exam environment provides.
- The checker verifies the end state only (Flathub remote, the app installed system-wide, no extra per-user copy). It cannot check that you removed and cleaned up along the way.

## Sources
- The man pages on your own system: `man flatpak-install`, `man flatpak-uninstall`, `man flatpak-list`, `man flatpak-info`, `man flatpak-search`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `sudo flatpak uninstall -y --all`
