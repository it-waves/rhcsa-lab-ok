# V01 command reference

| Command | What it does |
|---|---|
| `whoami` | print your user name |
| `hostname` | print the host name |
| `pwd` | print the current directory |
| `echo $SHELL` | print your login shell |
| `ls -l FILE` | long listing of a file |
| `ls -ld DIR` | long listing of a directory itself |
| `uname -r` / `uname --kernel-release` | kernel release (short and long option) |
| `echo $?` | exit status of the previous command (0 = success) |
| `mkdir -p DIR` | create a directory (and parents) |
| `touch FILE` | create an empty file |
| `touch "my file"` | quote a name that contains a space |
| `COMMAND --help` | short built-in usage text |
| `man COMMAND` | full manual page |
| `command -v NAME` | show whether a command exists |

Exit statuses seen in the video: 0 success, 1 mkdir missing operand, 2 invalid option or missing path, 127 command not found.
