#!/usr/bin/sh
#
# Script name: bm.sh
# Description: Search various search engines (inspired by surfraw).
# Dependencies: dmenu and a web browser
# Github: https://www.github.com/Motif23/
# Contributors: Motif Tech Services

BROWSER="qutebrowser"

declare -a options=(

"JW.org - https://www.jw.org/en/"
"Youtube - https://www.youtube.com/"
"Github - https://github.com/Motif23/"
"Shellcheck - https://www.shellcheck.net/"
"Arcolinux - https://arcolinux.com/"
"Suckless - https://suckless.org/"
"Archlinux - https://www.archlinux.org/"
"Distrowatch - https://www.distrowatch.com/"
"DT-Gitlab - https://gitlab.com/dwt1"
"Itsfoss - https://itsfoss.com/"
"Code-Radio - https://coderadio.freecodecamp.org/"
"Netflix - https://www.netflix.com/browse"
"UrbanDictionary - https://www.urbandictionary.com/"
"Wikipedia - https://www.wikipedia.org/"
"OMGUbuntu - http://www.omgubuntu.co.uk/"

"quit"
)

choice=$(printf '%s\n' "${options[@]}" | rofi -dmenu -i -l 10 -p 'Bookmarks')


if [[ "$choice" == quit ]]; then
	echo "Program Terminated." && exit 1
elif [ "$choice" ]; then
	cfg=$(printf '%s\n' "${choice}" | awk '{print $NF}')
	$BROWSER "$cfg"
else
	echo "Program Terminated." && exit 1
fi
