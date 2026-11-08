# Create and edit text files

Companion notes for the video. Not affiliated with or endorsed by Red Hat.

**On-screen captures are from Rocky Linux 10.2, a RHEL-compatible rebuild. It is not Red Hat Enterprise Linux.** Shell commands and their output are real; the prompt line is printed by the lab script in the default RHEL format. The package-install output is trimmed on screen.

## Exam objective (exact wording)
Create and edit text files

## About the lab (not the objective)
- vim needs a real terminal, which the recording script does not have. The vim screens in the video are real: a small script runs vim in a pseudo-terminal, sends the keys shown on screen, and records what vim displays. You press the same keys on your own lab. The script is `vimdrive.py` in the lab folder of the repo.
- `vi` is always installed on Red Hat systems; the `vim` command comes from the `vim-enhanced` package, which was not installed on the lab image. The video installs it with `sudo dnf install -y vim-enhanced`. The keys are the same in `vi`.

## What the video covers
1. Create files from the shell: `touch`, `echo text > file` (replace), `echo text >> file` (append), `cat`.
2. vim's two modes: normal (keys are commands) and insert (keys type text).
3. Save and quit: `:w`, `:q`, `:wq`, `:q!`.
4. Insert text (`G`, `o`, type, `Esc`), delete a line (`dd`), undo (`u`), search (`/text`).
5. Reboot step, then the practice task and checker.

## Honest limits
- vim has many more commands (visual mode, copy and paste, replace). The video covers enough to create and edit files; a vim tutorial (`vimtutor`) goes further.
- nano and other editors are valid on the exam too; this course uses vim.

## Sources
- The man page and built-in help on your own system: `man vim`, `vimtutor`.
- Red Hat EX200 exam page: check the current objective list before you book.

## Files
`practice.md`, `solution.md`, `check.sh`, `commands.md`, `captions.srt`

## Lab
Use the lab from V00 (user `student`, host `node1`). Reset: `rm -f empty.txt notes.txt lab7.txt`
