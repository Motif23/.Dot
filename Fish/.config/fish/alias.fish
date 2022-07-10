#
# ___  ___      _   _  __
# |  \/  |     | | (_)/ _|
# | .  . | ___ | |_ _| |     
# | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
# | |  | | (_) | |_| | |     https://github.com/Motif23/
# \_|  |_/\___/ \__|_|_|
#
# My alias.fish file. Nothing really special; some light customizations and some eye candy.


# Emacs
alias emacs='emacsclient -c -a 'emacs' &'

# Variety/Pywal
alias quit='variety -quit'
alias show='variety --show-current'
alias setwall='variety --set=SET_WALLPAPER'
alias next='login-next.sh'
alias prev='login-prev.sh'
alias trash='variety -t && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&'
alias fav='variety -f && wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&'
alias pref='variety --preferences'
alias select='variety --selector'
alias options='variety --set-option=SET_OPTIONS'
alias wallup='wal -i $(cat $HOME/.config/variety/wallpaper/wallpaper.jpg.txt)&'

# Feh
alias wall='feh --bg-fill --randomize ~/Pictures/Wallpapers'
alias wall2='feh --bg-fill --randomize ~/Pictures/Wallpapers2'
alias wall3='feh --bg-fill --randomize ~/Pictures/Wallpapers-Anime'

# Stow
alias stowan='stow --adopt -nvt ~'    # Import existing -- simulation (-n)
alias stowa='stow --adopt -vt ~'      # Import existing files (Use with care)
alias stow='stow -vSt ~'              # Stow the package
alias stowd='stow -vDt ~'             # Unstow the package

# Terminal Fun
alias aq='asciiquarium'
alias mx='cmatrix -rk'
alias cow='cowfortune'
alias fig='figlet'
alias clock='tty-clock -cB'
alias clk='clock-terminator.sh && sleep 1.5 && exit 1'

# Ani-cli
alias anime='~/.config/ani-cli/ani-cli'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --icons --group-directories-first' # my preferred listing
alias la='exa -a --color=always --icons --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --icons --group-directories-first'  # long format
alias lt='exa -aT --color=always --icons --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
alias lf='ls -p | grep -v /'                         # list just hidden files
alias ld='exa -Dl --color=always --icons'                            # list just directories
alias ljd='exa -D --color=always --icons'                            # list just directories without listview
alias le='exa --recurse'                                             #  list directory and the subdirectory it contains

# cd commands
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

# Display the directory structure better. All files printed
alias trees='tree --dirsfirst -aF'

# confirm before overwriting something
alias cp="cp -riv"
alias mv='mv -iv'
alias rm='rm -i'
alias mkdir='mkdir -pv'

# Parenting changing permssions on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# count number of files in directory
alias konte='ls | wc -l'

# Git
alias clone='git clone --depth 1'
alias stat='git status'
alias push='git-v1.sh'
alias gp='git push --set-upstream orgin'	# Merging branches to remote repo #
alias pull='git pull origin'
alias commit='git commit '
alias add='git add .'
alias gcat='git cat-file commit HEAD'
alias log='git log'
alias rebase='git rebase'
alias gbranch='git branch'
alias gshow='git show-branch'
alias gcheck='git checkout'
alias gdiff='git diff --name-only --relative --diff-filter=d | xargs bat --diff'
alias gmerge='git merge'
alias gremove='git rm'
alias gitname='git config --global user.name 'Motif23''
alias gitmail='git config --global user.email 'cemmanuel.tech@outlook.com''
alias gitstore='git config --global credential.helper store'
alias gitcache='git config --global credential.helper cache'
alias ginit='git init'
alias gremote='git remote add origin'

# Patch - Suckless Diffs
alias ptch='patch -p1 <'      # Patch Diff
alias rptch='patch -R <'      # Remove Patch Diff
alias cpcon='sudo cp config.def.h config.h'
alias mkins='sudo make && sudo make clean install'     # Install Diff

# Archwiki Search
alias wb='archman.sh' # Opens browser
alias wt='awman'  # Searches archwiki in terminal
alias wa='awman -k'  # Search in article content

# Bat
alias bat-theme='bat --list-themes'

# Start calculator with math support
alias bc='bc -lq'

# Phone Storage and SD Card Storage -- When mounted
alias phone='cd /run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_RF8N301TCEF/Phone/'
alias card='cd /run/user/1000/gvfs/mtp:host=SAMSUNG_SAMSUNG_Android_RF8N301TCEF/Card/'

#vim for important configuration files
#know what you do in these files
alias vlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias vlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias vslick="sudo $EDITOR /etc/lightdm/slick-greeter.conf"
alias vpacman="sudo $EDITOR /etc/pacman.conf"
alias vgrub="sudo $EDITOR /etc/default/grub"
alias vconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias vmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias vmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias varcomirrorlist='sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist'
alias vsddm="sudo $EDITOR /etc/sddm.conf"
alias vsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias vfstab="sudo $EDITOR /etc/fstab"
alias vnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias vsamba="sudo $EDITOR /etc/samba/smb.conf"
alias vgnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias vhosts="sudo $EDITOR /etc/hosts"
alias vhostname="sudo $EDITOR /etc/hostname"
alias vb="$EDITOR ~/.bashrc"
alias vz="$EDITOR ~/.zshrc"
alias vf="$EDITOR ~/.config/fish/config.fish"
alias vneofetch="$EDITOR ~/.config/neofetch/config.conf"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'
alias personal1='cp -Rf /personal/1/* ~'
alias personal2='cp -Rf /personal/2/* ~'
alias personal3='cp -Rf /personal/3/* ~'
alias personal4='cp -Rf /personal/4/* ~'
alias personal5='cp -Rf /personal/5/* ~'
alias personal6='cp -Rf /personal/6/* ~'
alias personal7='cp -Rf /personal/7/* ~'
alias personal8='cp -Rf /personal/8/* ~'
alias personal9='cp -Rf /personal/9/* ~'
