# Configure IPv4 and IPv6 addresses

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real.

**One step is done silently before the demo:** the lab deletes any old connection named `lab0` (`sudo nmcli connection delete lab0`) so it can be re-run. This is said in the video. The demo itself changes the system: it adds a connection `lab0` on a virtual `dummy0` interface with a static IPv4 and IPv6 address.

## Exam objective (exact wording)
Configure IPv4 and IPv6 addresses

## What the video covers
1. An address has a prefix length (`/24`, `/64`). NetworkManager stores settings in a connection; a device is the interface it is applied to.
2. `ip -br address` lists one line per interface.
3. `sudo nmcli connection add type dummy ifname dummy0 con-name lab0` creates a connection on a virtual interface.
4. `nmcli connection modify lab0 ipv4.method manual ipv4.addresses 192.168.50.10/24` and the same with `ipv6.method manual ipv6.addresses fd00:50::10/64`; `nmcli connection up lab0` applies it.
5. `ip -br address show dummy0` and `nmcli -f ... connection show lab0` confirm it; after a reboot the addresses are still there.

## Honest limits
- Only a dummy (virtual) interface is configured, not the real `ens3`, because a mistake there can cut your own connection.
- Not covered: nmcli on a real network card, gateway and DNS settings, `ip route`, `nmcli device`, DHCP, `hostnamectl`, and editing connection files by hand.
- The demo leaves connection `lab0` in place; remove it with `sudo nmcli connection delete lab0`.
- The checker reads state only.

## Sources
- The man pages on your own system: `man nmcli`, `man nm-settings`, `man ip`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
