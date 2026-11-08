# V00 - RHCSA EX200 RHEL 10: lab setup

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures in the video are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The exam is on RHEL 10, so use real RHEL 10 if you can.

## Official sources to read first
- Red Hat RHEL 10 installation guide, "System requirements and supported architectures": https://docs.redhat.com/en/documentation/Red_Hat_Enterprise_Linux/10/html/automatically_installing_rhel/system-requirements-and-supported-architectures
- Red Hat Developer Subscription for Individuals FAQ: https://developers.redhat.com/articles/faqs-no-cost-red-hat-enterprise-linux
- Red Hat EX200 exam page (check before you book).

## What those pages say (as read on 2026-11-07; re-check, they change)
- Minimum disk: 10 GiB. Minimum RAM (x86_64): 1.5 GiB for local-media install, 3 GiB for HTTP(S)/FTP network install.
- The no-cost Developer Subscription for Individuals is self-supported, for individuals, up to 16 systems, renewed every year. Read the current terms yourself.
- The page above does not mention a CPU level. Other vendors' documentation states RHEL 10 needs x86-64-v3 (Intel Haswell / AMD Excavator class or newer). Check with the command below.

## Lab spec used in this series (our choice, above Red Hat's minimums)
| Item | Value |
|---|---|
| vCPU | 2 |
| RAM | about 3 GiB |
| System disk | 20 GiB |
| Extra disks | two empty 5 GiB disks (vdb, vdc on virtio; may be sdb, sdc on VirtualBox) |
| NIC | one |
| User | `student` with sudo |
| Hostname | `node1` |

## Build steps
1. Create a free Red Hat account, join the Red Hat Developer program, download the RHEL 10 installer.
2. Create a VM with the spec above. If the CPU level check below fails, set the VM CPU to pass the host CPU through.
3. Install RHEL; create `student` as administrator.
4. Register the system: `sudo subscription-manager register` (RHEL only).
5. `sudo hostnamectl set-hostname node1`, log in as `student`.
6. Take a snapshot named `clean`.

## Verify the lab
```
cat /etc/redhat-release
nproc
free -h
/lib64/ld-linux-x86-64.so.2 --help | grep supported     # want x86-64-v3 listed
lsblk -o NAME,SIZE,TYPE,MOUNTPOINTS
getenforce                                              # Enforcing
systemctl is-active chronyd sshd
```
Or run `scripts/lab-check.sh` from this repo (read-only).

## Reset
Revert the VM to the `clean` snapshot.

## Practice task and solution
`practice.md` first. `solution.md` only after you try. Then run `check.sh` after rebooting.
