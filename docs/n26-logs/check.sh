#!/usr/bin/env bash
# N26 practice-task checker. Read-only.
fail=0
if sudo journalctl -t ex200 --no-pager 2>/dev/null | grep -q "practice message"; then echo "PASS: the journal has your ex200 message"; else echo "FAIL: no message with tag ex200 and text 'practice message' in the journal"; fail=1; fi
if grep -q "practice message" "$HOME/ex200.log" 2>/dev/null; then echo "PASS: ~/ex200.log contains the message"; else echo "FAIL: ~/ex200.log is missing or does not contain the message"; fail=1; fi
exit $fail
