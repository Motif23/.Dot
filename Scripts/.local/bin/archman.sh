#!/bin/bash
#
# Script name: archman.sh
# Description: Search various search engines (inspired by surfraw).
# Dependencies: dmenu and a web browser
# Github: https://www.github.com/Motif23/
# Contributors: Motif Tech Services

# Defining our web browser.
browser="qutebrowser"

echo "Which application?"
read -r application

nc -z 8.8.8.8 53  >/dev/null 2>&1
online=$?
if [ $online -eq 0 ]; then
    "$browser" https://wiki.archlinux.org/title/"$application"
else
    awman "$application"
fi
