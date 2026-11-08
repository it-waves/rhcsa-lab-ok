. /tmp/lab/lib.sh
step "Solution"
srun 'dnf -y install flatpak'
srun 'flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
srun 'flatpak install -y flathub org.gnome.Calculator >/dev/null 2>&1'
srun 'flatpak uninstall -y org.gnome.Calculator >/dev/null 2>&1'
srun 'flatpak install -y flathub org.gnome.Calculator >/dev/null 2>&1'
step "Checker"
run 'bash /tmp/lab/check.sh'
step "Checker fails when the app is missing"
srun 'flatpak uninstall -y org.gnome.Calculator >/dev/null 2>&1'
run 'bash /tmp/lab/check.sh'
srun 'flatpak install -y flathub org.gnome.Calculator >/dev/null 2>&1'
run 'bash /tmp/lab/check.sh'
