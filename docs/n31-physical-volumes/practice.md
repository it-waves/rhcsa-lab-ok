# Practice task: physical volumes

Work as `student`.

**Setup (once).** Make `/dev/vdb` a physical volume, so there is something to remove:

```
sudo pvcreate /dev/vdb
```

**Task.**

1. Create a physical volume on `/dev/vdc`.
2. Remove the physical volume on `/dev/vdb`.
3. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
