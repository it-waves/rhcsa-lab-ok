# Command reference

| Command | What it does |
|---|---|
| `ssh-keygen -t ed25519` | create a key pair (asks for a file name and a passphrase) |
| `ssh-keygen -q -t ed25519 -N '' -f FILE` | the same, quiet, empty passphrase, given file name (lab only) |
| `ssh-copy-id user@host` | install your default public key on the server |
| `ssh-copy-id -i FILE.pub user@host` | install a specific public key |
| `ssh user@host` | log in (uses the key if the server has it) |
| `ssh -i FILE user@host` | log in with a specific private key |
| `ssh -o BatchMode=yes user@host command` | never ask for a password: proves the key works |
| `ls -l ~/.ssh` | private key 600, public key 644, authorized_keys 600 |

On the server: `~/.ssh` 700, `~/.ssh/authorized_keys` 600.
