# Mount and unmount network file systems using NFS

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Important lab note:** one machine plays both server and client, so the server name is `localhost`. Before the demo, the lab (not shown) installs `nfs-utils`, creates `/srv/share` with a file `hello.txt`, writes `/srv/share 127.0.0.1(rw,sync)` into `/etc/exports`, starts the `nfs-server` service and runs `exportfs -ra`. On the exam the server is another machine and is already set up. These steps change the system.

## Exam objective (exact wording)
Mount and unmount network file systems using NFS

## What the video covers
1. What NFS is: a server shares a folder, a client mounts it. Source format: `SERVER:/path`.
2. `showmount -e localhost` lists what the server exports.
3. `sudo mkdir /mnt/nfs`, then `sudo mount -t nfs localhost:/srv/share /mnt/nfs`, then `df -hT /mnt/nfs` (type `nfs4`).
4. Use it: `ls /mnt/nfs`, `cat /mnt/nfs/hello.txt`, `findmnt /mnt/nfs`.
5. `sudo umount /mnt/nfs` (no N after the U); `findmnt` prints nothing; the folder is empty again.
6. After a reboot a manual mount is gone; the server still lists its share; mount again and the file is back.

## Honest limits
- Not covered: setting up the NFS server, `/etc/exports` options, firewall rules, mounting at boot (`/etc/fstab` with `nfs`), `_netdev`, automounting (next video), NFS versions and security (`sec=`), troubleshooting a hung mount.
- Mounting your own machine through `localhost` is a lab shortcut; a real server uses its hostname or IP address.
- The checker looks at the result: `/mnt/exam` is mounted from `localhost:/srv/exam` over NFS, `hello.txt` reads `exam ok`, and `/mnt/old` is not mounted.

## Sources
- The man pages on your own system: `man mount`, `man nfs`, `man showmount`, `man umount`, `man findmnt`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
