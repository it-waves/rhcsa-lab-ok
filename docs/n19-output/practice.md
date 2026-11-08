# Practice task: a small system report

Work in your home directory.

1. Create the folder `lab19`.
2. In it, create a script `report.sh` (use vim).
3. It prints two lines:
   - `Host: ` followed by the short host name
   - `Accounts: ` followed by the number of lines in the file `/etc/passwd`
4. Capture both values with command substitution, not by typing them.
5. Make the script executable.
6. Reboot, then run the checker (`bash check.sh`).

Example output: `Host: node1` and `Accounts: 26` (your number may differ).

The solution is in `solution.md`. Try first.
