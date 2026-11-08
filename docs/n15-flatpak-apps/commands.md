# Command reference

| Command | What it does |
|---|---|
| `flatpak search NAME` | search the remotes by name |
| `sudo flatpak update --appstream` | download the search data |
| `sudo flatpak install -y REMOTE APP-ID` | install an app system-wide, answering yes |
| `flatpak list` | apps and runtimes installed |
| `flatpak list --app` | applications only |
| `flatpak info APP-ID` | details of an installed app |
| `sudo flatpak uninstall -y APP-ID` | remove an app |
| `sudo flatpak uninstall -y --unused` | remove runtimes no app needs |
