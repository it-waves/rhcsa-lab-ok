#!/usr/bin/env bash
# N27 practice-task checker. Read-only.
fail=0
if grep -rhqE '^Storage=persistent' /etc/systemd/journald.conf /etc/systemd/journald.conf.d/ 2>/dev/null; then echo "PASS: Storage=persistent is set"; else echo "FAIL: Storage=persistent is not set in journald.conf"; fail=1; fi
if [ -d /var/log/journal ]; then echo "PASS: /var/log/journal exists"; else echo "FAIL: /var/log/journal does not exist"; fail=1; fi
if systemctl is-active --quiet systemd-journald; then echo "PASS: systemd-journald is running"; else echo "FAIL: systemd-journald is not running"; fail=1; fi
exit $fail
