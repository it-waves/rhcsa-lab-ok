# Locate, read, and use system documentation including man, info, and files in /usr/share/doc

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** The prompt line is printed by the lab script in the default RHEL format; the commands and their output are real and unedited. The `man` and `info` screens were recorded from the real pager in a scripted session; the dnf downloads are shortened on screen.

## Exam objective (exact wording)
Locate, read, and use system documentation including man, info, and files in /usr/share/doc

## What the video covers
1. `man -k word` searches page descriptions; `whatis name` gives a one-line summary with the section number. On this fresh image the index is empty until `sudo mandb -q` builds it.
2. `man -w page` shows where a page file lives (under `/usr/share/man`); `man ls` opens it in the pager `less` (Space = next screen, `/text` Enter = search, `q` = quit).
3. Sections: 1 = commands, 5 = file formats. `man 5 passwd` (section first). The `man-pages` package supplies section 5 pages here; rebuild the index again afterwards.
4. `info`: not installed on this image (`sudo dnf install -y info`); `info ls` opens the GNU manual for `ls`.
5. `/usr/share/doc`: one folder per installed package; `rpm -qd package` lists its documentation files; `head -n 8 file` shows the first lines.
6. Reboot step (the index survives), then the practice task and checker.

## Honest limits
- Not covered: `man -K` (full-text search), `apropos` (same as `man -k`), `info` navigation keys beyond quitting, `--help` output, `pinfo`.
- Whether a fresh RHEL 10 install already has these packages and index depends on the install; the lab here is Rocky Linux 10.2.

## Sources
- The man pages on your own system: `man man`, `man mandb`, `man whatis`, `man info`, `man rpm`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -rf lab11`
