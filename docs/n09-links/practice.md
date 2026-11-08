# Practice task: hard and soft links

Work in your home directory. Create the `links` folder if you do not have it.

1. Create `links/base.txt` that contains the word `lab9`.
2. Make `links/base-hard.txt`, a hard link to `base.txt`.
3. Make `links/base-soft.txt`, a soft link to `base.txt`.
4. Look at them with `ls -li links`. The hard link and the original show the same inode.
5. Reboot, then run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
