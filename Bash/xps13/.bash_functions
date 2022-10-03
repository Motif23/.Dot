#
# ___  ___      _   _  __
# |  \/  |     | | (_)/ _|
# | .  . | ___ | |_ _| |
# | |\/| |/ _ \| __| |  _|   Carl Emmanuel (MotifTechServices)
# | |  | | (_) | |_| | |     https://github.com/Motif23/
# \_|  |_/\___/ \__|_|_|
#
# My .bash_functions file. Nothing really special; some light customizations and some eye candy.


# Change directories and view directories inside

function lsd() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        exa -Dl --color=always --icons
}

# Change directories and view files inside

#function clf() {
#    DIR="$*";
#        # if no DIR given, go home
#        if [ $# -lt 1 ]; then
#                DIR=$HOME;
#    fi;
#    builtin cd "${DIR}" && \
#    # use your preferred ls command
#        colorls -f
#}

# Change directories and view all contents

function lsa() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        exa -al --color=always --group-directories-first
}

# Change directories and view all files, hidden included

function lsh() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        exa -al --color=always | grep \\.
}


# Automatically source .bashrc after editing

prompt_command() {
  # initialize the timestamp, if it isn't already
  _bashrc_timestamp=${_bashrc_timestamp:-$(stat -c %Y "$HOME/.bashrc")}
  # if it's been modified, test and load it
  if [[ $(stat -c %Y "$HOME/.bashrc") -gt $_bashrc_timestamp ]]
  then
    # only load it if `-n` succeeds ...
    if $BASH -n "$HOME/.bashrc" >& /dev/null
    then
        source "$HOME/.bashrc"
    else
        printf "Error in $HOME/.bashrc; not sourcing it\n" >&2
    fi
    # ... but update the timestamp regardless
    _bashrc_timestamp=$(stat -c %Y "$HOME/.bashrc")
  fi
}


# Use bat to colorize help text
# https://github.com/sharkdp/bat

alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}


# Remove the ^C when hitting Ctrl-C in terminal
stty -echoctl

# Restore the controls, use same name without dash
#stty echoctl
