#!/bin/bash

# A community-powered cheat sheet currently supporting 58 programming languages.
# https://github.com/chubin/cheat.sh

helpmsg() {
  printf "%s\n" "desc: search online cheat sheet database for common terminal commands ( http://cheat.sh )"
  printf "\n"
  printf "%s\n" "usage: ${0##*/} [program_name]"
  printf "\n"
  printf "%s\n" "  $ ${0##*/} curl"
  printf "%s\n" "------------------------------"
  curl http://cheat.sh
}
if [ $# -lt 1 ]; then
  helpmsg
  exit 1
elif [ "$1" = -h ] || [ "$1" = --help ]; then
  helpmsg
  exit 0
else
  curl http://cheat.sh/"$1"
fi