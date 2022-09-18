#!/bin/bash

# Open terminator with clock display
terminator -l Clock -be 'tty-clock -cB'

# Update wallpaper color scheme
wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&

sleep 1

# All done
echo "##### Done & Done #####" | lolcat
