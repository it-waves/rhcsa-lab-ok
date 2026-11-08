. /tmp/lab/lib.sh
step "1. Create directories"
run 'mkdir projects'
run 'mkdir projects/docs'
run 'mkdir -p projects/src/app'
run 'ls -R projects'
step "2. Create files"
run 'touch projects/docs/a.txt'
run 'echo "hello" > projects/docs/b.txt'
run 'ls projects/docs'
step "3. Copy"
run 'cp projects/docs/b.txt projects/docs/b-copy.txt'
run 'cp projects/docs/b.txt projects/src'
run 'cp -r projects/docs backup'
run 'ls backup'
run 'ls projects/src'
step "4. Move and rename"
run 'mv projects/docs/a.txt projects/docs/notes.txt'
run 'mv projects/docs/b-copy.txt projects/src/app'
run 'ls projects/docs'
run 'ls projects/src/app'
step "5. Delete"
run 'rm projects/docs/notes.txt'
run 'rm projects/docs'
run 'rmdir projects/src/app'
run 'rm -r projects/src/app'
run 'ls projects/src'
step "Practice task, solved (not shown in the video)"
run 'mkdir -p lab8/a lab8/b'
run 'echo "data" > lab8/a/one.txt'
run 'cp lab8/a/one.txt lab8/b'
run 'mv lab8/a/one.txt lab8/a/two.txt'
run 'ls lab8/a lab8/b'
