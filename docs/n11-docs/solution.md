# Solution

Finding the option: `man ls`, then press `/` and type `file size` (or `/sort`), Enter. The line `-S  sort by file size, largest first` shows the option.

Finding the section: `whatis group` lists `group (5)` (after `sudo mandb -q`), and `man 5 group` opens the file-format page.

```
mkdir lab11
echo "-S" > lab11/answer.txt
echo "5" >> lab11/answer.txt
cat lab11/answer.txt
```

Expected output of `cat`: `-S` then `5`.
