#!/bin/bash

echo -e "\e[33m====================\e[0m"
echo -e "\e[32mLet's Back Up Our Skel\e[0m"
echo -e "\e[33m====================\e[0m"
sleep 2
cp -Rf /etc/skel ~/.skel-backup-"$(date +%Y.%m.%d-%H.%M.%S)"

sleep 2
echo -e "\e[33m====================\e[0m"
echo -e "\e[32mDone ... Cleaning Terminal For Update\e[0m"
echo -e "\e[33m====================\e[0m"
sleep 2
clear; seq 1 "$(tput cols)" | sort -R | sparklines | lolcat

sleep 2

echo -e "\e[33m====================\e[0m"
echo -e "\e[32mCheck Root\e[0m"
echo -e "\e[33m====================\e[0m"
if [[ $UID == 0 ]]; then
	echo -e "\e[31mPlease run this script WITHOUT sudo:\e[0m"
	echo "$0 $*"
	exit 1
fi

sleep 2

echo -e "\e[33m====================\e[0m"
echo -e "\e[32mpacman -Syyu\e[0m"
echo -e "\e[33m====================\e[0m"
sudo pacman -Syyu

sleep 2

echo -e "\e[33m====================\e[0m"
echo -e "\e[32mList Orphans\e[0m"
echo -e "\e[33m====================\e[0m"

sleep 2

orphans=$(sudo pacman -Qdt)

sleep 2

if [ -z "$orphans" ]
then
	echo -e "\e[32mNo Orphans\e[0m"
else
	echo -e "\e[31m====================\e[0m"
	echo -e "\e[31mRemove Orphans\e[0m"
	echo -e "\e[31m====================\e[0m"
	sudo pacman -Rsn $(sudo pacman -Qdtq)
fi	

sleep 3

echo -e "\e[33m====================\e[0m"
read -p "Update ALL Packages? (yes/no) " yn
echo -e "\e[33m====================\e[0m"

case $yn in 
	yes ) echo -e "\e[32mOk, I Gotchu ... Update Commencing\e[0m";
		paru -Syu --noconfirm; 
		
		sleep 2

		echo -e "\e[33m====================\e[0m"
		read -p "Reboot? (yes/no) " yn
		echo -e "\e[33m====================\e[0m"

		case $yn in 
			yes ) echo -e "\e[32mOk, I'll Be Right Back\e[0m";
				sleep 2;
				reboot;;
			no ) echo -e "\e[31mDo Not Forget To Reboot\e[0m";
				 echo -e "\e[33m====================\e[0m";
				sleep 2 && exit;;
			* ) echo -e "\e[31mNot Valid ... Please Try Again...\e[0m";
				exit 1;;
	no ) echo -e "\e[31mReboot Needed\e[0m";
		
		sleep 2

		echo -e "\e[33m====================\e[0m"
		read -p "Reboot? (yes/no) " yn
		echo -e "\e[33m====================\e[0m"

		case $yn in 
			yes ) echo -e "\e[32mOk, I'll Be Right Back\e[0m";
				sleep 2 && reboot;;
			no ) echo -e "\e[31mDo Not Forget To Reboot\e[0m";
				 echo -e "\e[33m====================\e[0m";
				sleep 2 && exit;;
			* ) echo -e "\e[31mNot Valid ... Please Try Again...\e[0m";
				exit 1;;
		esac;;
	* ) echo -e "\e[31mNot Valid ... Please Try Again...\e[0m";
		exit 1;;
esac 