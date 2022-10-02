#!/bin/bash 

vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"

if [ "$vol" -gt "70" ]; then
	icon="🔊"
elif [ "$vol" -gt "30" ]; then
	icon="🔉"
elif [ "$vol" -gt "0" ]; then
	icon="🔈"
else
        echo 🔇 && exit
fi

echo "$icon$vol%"