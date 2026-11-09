# Command reference

| Command | What it does |
|---|---|
| `showmount -e SERVER` | list the folders a server exports |
| `sudo mkdir FOLDER` | make an empty folder to mount on |
| `sudo mount -t nfs SERVER:/path FOLDER` | mount an NFS share |
| `df -hT FOLDER` | size and type (`nfs4`) |
| `findmnt FOLDER` | how it is mounted (no output = not mounted) |
| `sudo umount FOLDER` | unmount (no N after the U) |
