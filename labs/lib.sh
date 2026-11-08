# Shared helpers. Every command is run for real; its output is captured as-is.
# Transcript format: "[student@node1 ~]$ command" then the real output.
run() {  # run as student
  printf '[%s@%s ~]$ %s\n' "$(id -un)" "$(hostname -s)" "$*"
  local out rc; out=$(bash -ic "$*" 2>&1); rc=$?
  printf '%s\n' "$out" | grep -v -e 'cannot set terminal process group' -e 'no job control in this shell'
  echo "# exit=$rc"
}
srun() { # run as root through sudo
  printf '[%s@%s ~]$ sudo %s\n' "$(id -un)" "$(hostname -s)" "$*"
  sudo bash -c "$*" 2>&1
  echo "# exit=$?"
}
step() { printf '\n===== %s =====\n' "$*"; }
