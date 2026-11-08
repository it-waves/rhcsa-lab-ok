# Solution

    sudo dnf -y install flatpak
    sudo flatpak remote-add labhub https://dl.flathub.org/repo/flathub.flatpakrepo
    sudo flatpak remote-modify --disable labhub
    flatpak remotes --show-disabled

After a reboot, `flatpak remotes --show-disabled` still lists `labhub` as `system,disabled`.
