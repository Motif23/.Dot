#!/usr/bin/env bash
#
# Script name: dmconf.sh
# Description: Search various search engines (inspired by surfraw).
# Dependencies: dmenu and a web browser
# Github: https://www.github.com/Motif23/
# Contributors: Motif Tech Services

# Defining the text editor to use.
# DMENUEDITOR="vim"
# DMENUEDITOR="nvim"
DMEDITOR="subl"

# An array of options to choose.
# You can edit this list to add/remove config files.
declare -a options=(
"alacritty - $HOME/.config/alacritty/alacritty.yml"
"alias - $HOME/.bash_aliases"
"awesome - $HOME/.config/awesome/rc.lua"
"awesome-auto - $HOME/.config/awesome/autostart.sh"
"bash - sudo $HOME/.bashrc"
"dwm - $HOME/.config/Suckless/suckless-carl/dwm/config.def.h"
"dwm-auto - $HOME/.dwm/autostart.sh"
"fish - $HOME/.config/fish/config.fish"
"leftwm - $HOME/.config/leftwm/config.toml"
"i3 - $HOME/.config/i3/config"
"picom - $HOME/.config/Suckless/suckless-carl/dwm/picom.conf"
"polybar - $HOME/.config/polybar/config"
"qutebrowser - $HOME/.config/qutebrowser/config.py"
"spacevim - $HOME/.Spacevim.d/init.toml"
"st - $HOME/.config/Suckless/suckless-carl/st/config.def.h"
"surf - $HOME/.config/Suckless/suckless-carl/surf/config.def.h"
"sxhkd - $HOME/.config/Suckless/suckless-carl/dwm/sxhkd/sxhkdrc"
"termite - $HOME/.config/termite/config"
"xresources - $HOME/.Xresources"
"zsh - sudo $HOME/.zshrc"
"quit"
)

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p 'Edit config:')

# What to do when/if we choose 'quit'.
if [[ "$choice" == "quit" ]]; then
    echo "Program terminated." && exit 1

# What to do when/if we choose a file to edit.
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$DMEDITOR "$cfg"

# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 1
fi
