# Practice task: logical volumes

Work as `student`.

**Setup (once).** Create the group and an old volume to delete:

```
sudo pvcreate /dev/vdb /dev/vdc
sudo vgcreate examvg /dev/vdb /dev/vdc
sudo lvcreate -y -n oldlv -L 100M examvg
```

**Task.**

1. Create a logical volume called `examlv` of 300 MiB in `examvg`.
2. Delete the logical volume `oldlv`.
3. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
