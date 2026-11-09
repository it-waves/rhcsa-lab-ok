# Practice task: diagnose file permission problems

Work as `student`.

**Setup (once).**

```
printf '#!/bin/bash\necho run ok\n' > ~/run.sh
chmod 644 ~/run.sh
sudo mkdir -p /srv/data/private
echo 'plan ok' | sudo tee /srv/data/private/plan.txt
sudo chmod 700 /srv/data/private
sudo chmod 640 /srv/data/private/plan.txt
```

**Task.**

1. `~/run.sh` does not run. Find out why and fix it.
2. `/srv/data/private/plan.txt` cannot be read by `student`. Find out why (use `ls -l` and `namei -l`) and fix it.
3. Do not make the folder writable by everyone.
4. Run the checker (`bash check.sh`).

The solution is in `solution.md`. Try first.
