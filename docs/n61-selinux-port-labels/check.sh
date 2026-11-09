#!/usr/bin/env bash
# N61 practice-task checker. Read-only.
if sudo semanage port -l -C 2>/dev/null | grep -E '^http_port_t +tcp' | grep -qw 8899; then echo "PASS: tcp port 8899 is labeled http_port_t"; exit 0; else echo "FAIL: tcp port 8899 is not labeled http_port_t"; exit 1; fi
