#!/usr/bin/env bash
# N60 practice setup: puts a file with a wrong SELinux label in /etc
echo "setting = 1" > ~/practice.conf
sudo mv ~/practice.conf /etc/practice.conf
ls -Z /etc/practice.conf
