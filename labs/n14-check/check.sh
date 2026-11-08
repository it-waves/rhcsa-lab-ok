#!/usr/bin/env bash
# N14 practice-task checker. Read-only. Run as the user who did the task.
fail=0
line=$(flatpak remotes --system --columns=name,url,options 2>/dev/null | grep -E '^labhub[[:space:]]' | head -n 1)
if [ -n "$line" ]; then echo "PASS: a system-wide Flatpak repository named labhub exists"; else echo "FAIL: add a system-wide Flatpak repository named labhub"; fail=1; fi
if echo "$line" | grep -q 'https://dl.flathub.org/repo/'; then echo "PASS: labhub points to the Flathub address"; else echo "FAIL: labhub should use the Flathub address https://dl.flathub.org/repo/flathub.flatpakrepo"; fail=1; fi
if echo "$line" | grep -q 'disabled'; then echo "PASS: labhub is disabled"; else echo "FAIL: labhub should be disabled"; fail=1; fi
exit $fail
