. /tmp/lab/lib.sh
step "Solution"
srun 'dnf -y install flatpak'
srun 'flatpak remote-add labhub https://dl.flathub.org/repo/flathub.flatpakrepo'
srun 'flatpak remote-modify --disable labhub'
step "Checker"
run 'bash /tmp/lab/check.sh'
run 'flatpak remotes --system --show-disabled --columns=name,url,options'
