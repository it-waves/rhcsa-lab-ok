# Command reference: ssh and scp

| Command | Meaning |
|---|---|
| `ssh user@host` | interactive login as user on host |
| `ssh user@host command` | run one command there and print the result here |
| `ssh host command` | same, using your current user name |
| `ssh -p 2222 host` | connect to a different port (default 22) |
| `scp file host:/path/` | copy a local file to the remote machine |
| `scp host:/path/file .` | copy a remote file here |
| `exit` | leave an interactive ssh session |

## Reading errors
| Message | Meaning |
|---|---|
| Could not resolve hostname | the name is wrong or DNS cannot find it |
| Permission denied | the machine answered, but refused your login (wrong user, password, or key) |
| Connection refused | the machine answered, but nothing is listening on that port |

## Commands from earlier videos used here
`echo` prints text; `>` writes output to a file; `cat` shows a file; `mkdir` makes a directory.
