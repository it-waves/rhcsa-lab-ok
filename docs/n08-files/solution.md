# Solution

```
mkdir -p lab8/a lab8/b
echo "data" > lab8/a/one.txt
cp lab8/a/one.txt lab8/b
mv lab8/a/one.txt lab8/a/two.txt
ls lab8/a lab8/b
```

`mkdir -p` creates both directories (and `lab8`) in one command. `cp` into a directory keeps the file name, so `lab8/b/one.txt` exists. `mv` inside the same folder renames, so `lab8/a` ends up holding only `two.txt`.
