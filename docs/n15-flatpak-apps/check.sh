#!/usr/bin/env bash
# N15 practice-task checker. Read-only. Run as the user who did the task.
fail=0
if flatpak remotes --system --columns=name 2>/dev/null | grep -qx 'flathub'; then echo "PASS: the system-wide remote flathub exists"; else echo "FAIL: add the system-wide remote flathub"; fail=1; fi
if flatpak list --system --app --columns=application 2>/dev/null | grep -qx 'org.gnome.Calculator'; then echo "PASS: org.gnome.Calculator is installed system-wide"; else echo "FAIL: install org.gnome.Calculator system-wide"; fail=1; fi
if flatpak list --user --app --columns=application 2>/dev/null | grep -qx 'org.gnome.Calculator'; then echo "FAIL: org.gnome.Calculator should not be installed for the user as well"; fail=1; else echo "PASS: no extra per-user copy"; fi
exit $fail
