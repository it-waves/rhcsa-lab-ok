# Solution

    sudo dnf -y install flatpak
    sudo flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    sudo flatpak install -y flathub org.gnome.Calculator
    flatpak list --app

Practise the removal (the checker only sees the end state):

    sudo flatpak uninstall -y org.gnome.Calculator
    sudo flatpak uninstall -y --unused
    sudo flatpak install -y flathub org.gnome.Calculator

If `flatpak list --user --app` shows the app, remove that copy with `flatpak uninstall --user -y org.gnome.Calculator`.
