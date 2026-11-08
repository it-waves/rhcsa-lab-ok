# Command reference

| Command | What it does |
|---|---|
| `sudo dnf -y install flatpak` | install the Flatpak tool |
| `flatpak remotes` | list enabled remotes |
| `flatpak remotes --show-details` | title, address, scope |
| `flatpak remotes --show-disabled` | include disabled remotes |
| `sudo flatpak remote-add NAME ADDRESS` | add a system-wide remote |
| `flatpak remote-add --user NAME ADDRESS` | add a remote for your user only |
| `flatpak remote-ls NAME --app` | list applications a remote offers |
| `sudo flatpak remote-modify --disable NAME` | turn a remote off |
| `sudo flatpak remote-modify --enable NAME` | turn a remote on |
| `flatpak remote-delete --user NAME` | remove a per-user remote |
| `sudo flatpak remote-delete NAME` | remove a system-wide remote |
