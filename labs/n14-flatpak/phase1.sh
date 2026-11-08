. /tmp/lab/lib.sh
step "1. Install Flatpak"
srun 'dnf -y install flatpak'
run 'flatpak --version'
run 'flatpak remotes'
step "2. Add a repository"
srun 'flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
run 'flatpak remotes'
run 'flatpak remotes --show-details'
step "3. Look inside it"
run 'flatpak remote-ls flathub --app | head -n 5'
step "4. Disable and enable"
srun 'flatpak remote-modify --disable flathub'
run 'flatpak remotes'
srun 'flatpak remote-modify --enable flathub'
run 'flatpak remotes'
step "5. A repository for one user"
run 'flatpak remote-add --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
run 'flatpak remotes'
step "6. Remove"
run 'flatpak remote-delete --user flathub'
srun 'flatpak remote-delete flathub'
run 'flatpak remotes'
step "7. Add it back"
srun 'flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
run 'flatpak remotes'
