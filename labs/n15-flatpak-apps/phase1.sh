. /tmp/lab/lib.sh
step "0. Before we start"
srun 'dnf -y install flatpak'
srun 'flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
run 'flatpak remotes'
step "1. Search"
run 'flatpak search calculator'
srun 'flatpak update --appstream'
run 'flatpak search calculator'
step "2. Install"
srun 'flatpak install -y flathub org.gnome.Calculator'
step "3. What is installed"
run 'flatpak list'
run 'flatpak list --app'
run 'flatpak info org.gnome.Calculator'
step "4. Remove"
srun 'flatpak uninstall -y org.gnome.Calculator'
run 'flatpak list --app'
run 'flatpak list'
srun 'flatpak uninstall -y --unused'
run 'flatpak list'
step "5. Install again"
srun 'flatpak install -y flathub org.gnome.Calculator'
run 'flatpak list --app'
