#!/bin/bash

function run {
 if ! pgrep $1 ;
  then
    $@&
  fi
}

run "variety"
run "nm-applet"
run "xfce4-clipman"
run dwmblocks &
picom -b  --config ~/.config/Suckless/suckless-carl/dwm/picom.conf &
sxhkd -c ~/.config/Suckless/suckless-carl/dwm/sxhkd/sxhkdrc &
run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx on"
run "mpd"
run "xscreensaver -no-splash"
run /usr/bin/emacs --daemon &
run /usr/lib/python3.10/site-packages/pywalfox/bin/main.sh

#run "volumeicon"
#run "blueberry-tray"
#run "pamac-tray"
#run "xfce4-power-manager"
#picom --experimental-backends
#run "nitrogen --restore"
#run slstatus &
#run "conky -c $HOME/.config/arco-dwm/system-overview"
#you can set wallpapers in themes as well
#feh --bg-fill /usr/share/backgrounds/arcolinux/arco-wallpaper.jpg &

# Add this to your .xinitrc or whatever file starts programs on startup.
# wal -R restores the last colorscheme that was in use.
