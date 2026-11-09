# Practice task: a port label

Work as `student`, in a virtual machine. `semanage` must be installed (see the README).

**Task.** Label tcp port 8899 as `http_port_t`, so that it is permanent. Run the checker: `bash check.sh`. Then reboot and run the checker again: the label must survive the reboot.

The solution is in `solution.md`. Try first.
