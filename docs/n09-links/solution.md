# Solution

```
mkdir -p links
echo "lab9" > links/base.txt
ln links/base.txt links/base-hard.txt
ln -s base.txt links/base-soft.txt
ls -li links
```

The hard link shares the inode of `base.txt` (same first column, link count 2). The soft link has its own inode and shows `-> base.txt`. The soft-link target is `base.txt`, not `links/base.txt`, because it is resolved from the folder that holds the link.
