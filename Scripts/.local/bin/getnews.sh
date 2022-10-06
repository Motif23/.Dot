#!/bin/bash

# This is a web server that formats the news (primarily US based) from various sources on the web for display in the terminal. A link to each article is included if you want to read the full article.
# https://github.com/omgimanerd/getnews.tech

helpmsg() {
  printf "%s\n" "desc: a web server that fetches data from the News API and formats it for display in the terminal"
  printf "\n"
  printf "%s\n" "usage: ${0##*/}"
  printf "\n"
  printf "%s\n" "  $ ${0##*/}"
  printf "%s\n" "  $ ${0##*/} category=general,page=2,reverse "
  printf "%s\n" "  $ ${0##*/} category=health,page=2,reverse "
  printf "%s\n" "  $ ${0##*/} category=technology,page=2,reverse "
  printf "%s\n" "  $ ${0##*/} category=science,page=2,reverse "
}
if [ "$1" = -h ] || [ "$1" = --help ]; then
  helpmsg
  exit 0
else
  curl us.getnews.tech/"$1"
fi