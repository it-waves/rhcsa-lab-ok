# Solution

```
sudo dnf -y install createrepo_c
mkdir lab12repo
dnf download --destdir lab12repo zip
createrepo_c lab12repo
sudo dnf config-manager --add-repo file:///home/student/lab12repo
```

Replace `student` with your own user name if it differs. Check:

```
dnf repolist
dnf --repo=home_student_lab12repo list available
```

Expected: the repository `home_student_lab12repo` is listed, and `zip` is available in it. (The repository id is made from the folder path.)
