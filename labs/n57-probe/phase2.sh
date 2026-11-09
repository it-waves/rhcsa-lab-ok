. /tmp/lab/lib.sh
step "after"
run 'timeout 30 ssh -i ~/.ssh/lab_key olga@localhost id'
