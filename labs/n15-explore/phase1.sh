. /tmp/lab/lib.sh
step "setup"
srun 'dnf -y install flatpak'
srun 'flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo'
step "search"
run 'flatpak search calculator'
run 'flatpak search hello'
run 'flatpak remote-ls flathub --app --columns=application,name,download-size | grep -i -E "hello|cowsay|fortune|bustle|gnome.Calc" | head -n 20'
