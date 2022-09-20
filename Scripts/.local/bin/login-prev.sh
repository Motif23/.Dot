#!/bin/bash

variety -p && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)

# Extract current wallpaper from variety 
login_pic=$(head -1 /home/carl/.config/variety/wallpaper/wallpaper.jpg.txt)

cp $login_pic /usr/share/pixmaps/login_pic.jpg && pywalfox update;

sleep 1;

cd /home/carl/.config/Suckless/suckless-carl/dwm/ && sudo make clean install;

sleep 1 && clear && archlinux-logout