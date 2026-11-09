# Configure autofs

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**Important lab note:** before the demo, the lab (not shown) installs `nfs-utils` and `autofs`, creates `/srv/share` with a file `hello.txt`, writes `/srv/share 127.0.0.0/8(rw,sync)` into `/etc/exports`, starts the `nfs-server` service and runs `exportfs -ra`. These steps change the system. On the exam the server is another machine and is already set up.

**Why 127.0.0.2:** when the server is the same machine, autofs shortcuts with a local bind mount and the result is not NFS (we saw this in a first run: `findmnt` showed the local XFS disk). The lab therefore uses `127.0.0.2`, a second loopback address, so the mount is a real NFS mount. On the exam, use the real server name.

## Exam objective (exact wording)
Configure autofs

## What the video covers
1. autofs mounts on demand: the first access mounts, idling unmounts.
2. Master map: `/etc/auto.master.d/nfs.autofs` with `/mnt/auto /etc/auto.nfs --timeout=10`.
3. Map file: `/etc/auto.nfs` with `data -fstype=nfs4,rw 127.0.0.2:/srv/share`.
4. `sudo systemctl enable --now autofs`; before any access `ls /mnt/auto` and `findmnt /mnt/auto/data` print nothing.
5. `ls /mnt/auto/data` and `cat /mnt/auto/data/hello.txt` mount it; `findmnt` shows type `nfs4`.
6. After `sleep 20` (longer than the 10 s timeout) `findmnt` prints nothing again.
7. After a reboot autofs is enabled and mounts on demand again.

## Honest limits
- Not covered: wildcard and direct maps, `/etc/auto.master` itself, home-directory automounts, LDAP/NIS maps, options other than the ones shown, firewalls and server setup, troubleshooting (`journalctl -u autofs`).
- The 10 second timeout is only to make the demo quick; the default is much longer.
- The checker reads `/remote/exam/hello.txt`, which triggers the automount, and checks autofs is enabled and running and that `/remote/exam` is an `nfs4` mount of `127.0.0.2:/srv/exam`.

## Sources
- The man pages on your own system: `man autofs`, `man auto.master`, `man 5 autofs`, `man systemctl`, `man tee`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
