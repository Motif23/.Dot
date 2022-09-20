#!/bin/bash

# Online dictionary
# https://curl.se/mail/archive-2015-12/0011.html

helpmsg() {
  printf "%s\n" "desc: online dictionary lookup"
  printf "\n"
  printf "%s\n" "usage: ${0##*/} [word]"
  printf "\n"
  printf "%s\n" "  $ ${0##*/} telomere"
}
if [ $# -lt 1 ]; then
  helpmsg
  exit 1
elif [ "$1" = -h ] || [ "$1" = --help ]; then
  helpmsg
  exit 0
else
  curl dict://dict.org/d:"$1" | less
fi