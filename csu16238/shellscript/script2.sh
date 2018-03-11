#!/bin/bash

echo " OS and version, release number, kernel version:$(lsb_release -a)"
echo "available shells:cat/etc/shells"
echo "Mouse settings:$(xinput --list --short)"
echo "Computer information:$(lscpu)"
echo "Memory info:$(free -m)"
echo "File system:$(sudo fdisk -l)"
