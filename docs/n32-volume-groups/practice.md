# Practice task: a volume group

Work as `student`.

**Setup (once).** Make the two spare disks physical volumes:

```
sudo pvcreate /dev/vdb /dev/vdc
```

**Task.**

1. Create a volume group called `examvg` with `/dev/vdb`.
2. Add `/dev/vdc` to `examvg`.
3. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
