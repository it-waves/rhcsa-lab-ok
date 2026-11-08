# Practice task: GPT partitions on a spare disk

Work as `student`, on the blank disk `/dev/vdc`. Check with `lsblk` first: it must be empty.

**Task.**

1. Create a GPT label on `/dev/vdc`.
2. Create partition 1 of 500 MiB.
3. Create partition 2 right after it (1 GiB).
4. Delete partition 2.
5. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
