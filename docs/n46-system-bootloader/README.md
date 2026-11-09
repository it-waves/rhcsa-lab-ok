# Modify the system bootloader

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real. The lab VM boots with UEFI; on it the generated file is `/boot/grub2/grub.cfg`. Long output is shortened on screen and marked with `...`.

**Nothing is changed silently before the demo.** The demo does change the system: it edits `/etc/default/grub`, regenerates `grub.cfg`, and adds a kernel argument to all boot entries.

## Exam objective (exact wording)
Modify the system bootloader

## What the video covers
1. GRUB2 settings live in `/etc/default/grub`; the machine reads the generated `/boot/grub2/grub.cfg`. Two steps: edit, then regenerate.
2. `grep -E '^GRUB_(TIMEOUT|CMDLINE_LINUX)' /etc/default/grub` shows the timeout and kernel arguments; `sudo grubby --default-kernel` shows the default kernel.
3. `sudo sed -i 's/^GRUB_TIMEOUT=.*/GRUB_TIMEOUT=10/' /etc/default/grub` changes the timeout; `sudo grub2-mkconfig -o /boot/grub2/grub.cfg` regenerates the file.
4. `sudo grubby --update-kernel=ALL --args="audit=1"` adds a kernel argument to every boot entry; `sudo grubby --info=DEFAULT` shows the default entry.
5. After a reboot, `cat /proc/cmdline` shows `audit=1` and the generated file has `set timeout=10`.

## Honest limits
- Not covered: `--remove-args`, `--set-default`, the GRUB password, editing the menu entry at boot with `e`, BIOS-versus-UEFI differences, `grub2-install`, Secure Boot, and recovering a machine that does not boot.
- The `grubby --info=DEFAULT` output is shortened on screen (initrd, title and id lines not shown), and only two of the `timeout` lines of `grub.cfg` are shown after the reboot.
- Changes to the bootloader can stop a machine from booting. Practice in a virtual machine.
- The demo leaves `GRUB_TIMEOUT=10` and `audit=1` in place; undo with another `sed`, `grub2-mkconfig` and `sudo grubby --update-kernel=ALL --remove-args="audit=1"`.
- The checker reads state only.

## Sources
- The man pages on your own system: `man grubby`, `man grub2-mkconfig`, and the GRUB manual (`info grub2`).
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`).
