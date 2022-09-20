#!/usr/bin/env sh

#
# ___  ___      _   _  __
# |  \/  |     | | (_)/ _|
# | .  . | ___ | |_ _| |     
# | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
# | |  | | (_) | |_| | |     https://github.com/Motif23/
# \_|  |_/\___/ \__|_|_|
#
# My autodl-wallhaven.sh file. Nothing really special; some light customizations and some eye candy.


# Variable (you can change any of these to your liking)
real_wall_dir=~/Pictures/New-Wallpapers/Wallhaven
temp_wall_dir=/tmp/wallpaper_wallhaven
expire_wall_date=30

# create folders
mkdir -p $real_wall_dir	
mkdir -p $temp_wall_dir

cd $temp_wall_dir || exit

# get links of images and download it
get_random_url=$(lynx -listonly -nonumbers -dump "https://wallhaven.cc/random" | grep '/w/')
get_images_url=$(echo "$get_random_url" | while read -r line; do lynx -source "$line" | grep -Po '<img id="wallpaper" src="\K[^"]+' ; done )
echo "$get_images_url" | while read -r line; do wget -N "$line" ; done

# delete any file under 200k in size (to avoid shitty thumnbails or crap quality)
find . -type f -iname "*.jp*g" -size -200k -exec rm {} \;
find . -type f -iname "*.png" -size -200k -exec rm {} \;

# change the downloaded wallpaper metadata (modified date to todays date)
#  this makes it easy to see which files are older to delete later on
find . -type f -iname "*.jp*g" -exec touch -m {} \;
find . -type f -iname "*.png" -exec touch -m {} \;

# now that everything is cleaned and filter
#  send the downloaded images to the wallpaper folder 
find . -type f -iname "*.jp*g" -exec mv {} $real_wall_dir \;
find . -type f -iname "*.png" -exec mv {} $real_wall_dir \;

#  delete wallpaper image older then X days and remove temp folder
#rm -rf $temp_wall_dir
#find $real_wall_dir -mtime +$expire_wall_date -exec rm {} \;
